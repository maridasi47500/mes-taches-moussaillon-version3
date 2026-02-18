class Address < ApplicationRecord
has_and_belongs_to_many :posts, :join_table => :postshaveaddresses
    accepts_nested_attributes_for :posts, allow_destroy: true

  belongs_to :country, optional: true
    accepts_nested_attributes_for :country, allow_destroy: true
  belongs_to :city, optional: true
    accepts_nested_attributes_for :city, allow_destroy: true
  belongs_to :state, optional: true
    accepts_nested_attributes_for :state, allow_destroy: true
  belongs_to :place, optional: true
    accepts_nested_attributes_for :place, allow_destroy: true
after_initialize do
self.city ||=City.new
self.country ||=Country.new
self.state ||=State.new
self.place ||=Place.new
end
def self.findbyname(name)
x="%#{name.downcase.gsub(' ','%')}%"
left_joins(:country).left_joins(:city).left_joins(:state).left_joins(:place).select('addresses.*, cities.name_fr as city, countries.name_fr as country, states.name_fr as state, places.name as place,addresses.address as address').group('addresses.id').having(["address like ? or city like ? or country like ? or place like ? or state like ?",x,x,x,x,x])

end
before_save do
self.city = City.find_or_initialize_by(name_fr: self.city.try(:name_fr))
self.country = Country.find_or_initialize_by(name_fr: self.country.try(:name_fr))
self.state = State.find_or_initialize_by(name_fr: self.state.try(:name_fr))
self.place = Place.find_or_initialize_by(name: self.place.try(:name))
end
def myaddress
  str = ""
  [city,country,state].each do |object|
    
  if object
  str += object.name
  str+= ", "
  end
  end
  str += address
  str
end
end
