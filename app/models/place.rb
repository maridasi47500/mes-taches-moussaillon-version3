class Place < ApplicationRecord
def self.findbyname(n)			
      o='%'+n.gsub(' ','%').downcase+'%'
        where(["lower(name) like ?",o])	
							      
end							      
def self.findbyid(h)
where(id: h)
end

   validates_length_of :name, minimum: 1, message: "enter places in relation to what you're saying"
belongs_to :city, optional: true
belongs_to :country, optional: true
belongs_to :state, optional: true
  validates_length_of :image, minimum: 1, message: "enter places in relation to what you're saying"
    has_and_belongs_to_many :posts, :join_table => :placesandposts
  accepts_nested_attributes_for :posts, allow_destroy: true
has_many :my_posts_surnames, class_name: 'PostsSurname', foreign_key: 'place_id'
def self.nbpages
(all.length / 10).to_i
end
def self.bypage(i)
all.limit(10).offset(i * 10)
end

def image=(file)
    if file.is_a?(String)
    self.write_attribute(:image,file)
  else

      pathfile = file.tempfile.path
    filename =file.original_filename
      loc='photos'
abs="/app/assets/images/"+filename
p abs
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:image,file.original_filename)

    end
end
def image
read_attribute(:image)
end
accepts_nested_attributes_for :my_posts_surnames, allow_destroy: true
has_many :places_tasks
has_many :tasks, through: :places_tasks


end
