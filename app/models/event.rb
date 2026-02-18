class Event < ApplicationRecord
translates :name
belongs_to :event_type, optional:true
has_and_belongs_to_many :tasks
#  geocoded_by :latitude => :latitude, :longitude => :longitude
#  reverse_geocoded_by :latitude, :longitude
#  after_validation :reverse_geocode
#reverse_geocoded_by :address
#reverse_geocoded_by :latitude, :longitude
#after_validation :geocode, :reverse_geocode

  has_many :sailorjobs, class_name: 'Sailorjob'
  has_many :sailors, through: :sailorjobs, class_name: 'Person', source: 'sailor'

belongs_to :city, optional: true
belongs_to :country, optional: true
belongs_to :state, optional: true

    has_many :relatedtaskstables, class_name: 'Additionaltask', foreign_key: 'maintask_id'
  has_many :relatedtasks, through: :relatedtaskstables, source: :relatedtask, class_name: 'Task'
  alias_attribute :lon, :longitude
  alias_attribute :lat, :latitude
   def image
  image=self.read_attribute(:image)

  image && image.include?('http:') ? image : "/assets/#{image}"
end
def image=(file)
      pathfile = file.tempfile.path
    filename =file.original_filename
    namefile="#{(rand()*100000000).to_i}.#{filename.split('.')[1]}"
      loc='photos'
pathfirst=Rails.root.to_s+"/app/assets/images/"
abs=pathfirst+namefile
p abs
`mkdir -p #{pathfirst}; mv #{pathfile} #{abs};`
write_attribute(:image, namefile)
#save
    #image =Post.cloud([loc,filename].join('/'),pathfile)
    #if image
    #self.write_attribute(:image,image)
    #end
end


  
  def taskid=(id)
    self.tasks << Task.find(id)
  end
  def personid=(id)
    self.relatedpeople << Person.find(id)
  end
  def aproximite
    places=self.latitude && self.longitude && self.latitude.length > 0 && self.longitude.length > 0 ? [self]+Place.near([self.latitude.to_f, self.longitude.to_f], 100) : []
    places.pluck(:name, :latitude,:longitude)
  end
def self.findbyid(n)
where("id" => n)
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
end


end
