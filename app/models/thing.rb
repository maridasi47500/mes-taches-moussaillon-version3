class Thing < ApplicationRecord
has_many :taskusedstuffs
has_many :tasks, through: :taskusedstuffs

has_many :jobusedstuffs
has_many :jobs, through: :jobusedstuffs
def self.findbyid(h)
where(id: h)
end
before_validation :createdme, on: :create
def createdme
self.created_at=DateTime.now
end
before_validation :updateme, on: :update
def updateme
self.updated_at=DateTime.now
end
def self.todays
where("created_at > ? or updated_at > ? ", DateTime.now.beginning_of_day, DateTime.now.beginning_of_day)
end
def indenombrable?
self.type == 'Food' || self.type == 'Drink'
end

translates :name
has_and_belongs_to_many :tasks
has_many :my_posts_surnames, class_name: 'PostsSurname', foreign_key: 'place_id'
accepts_nested_attributes_for :my_posts_surnames
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
end
def self.find_by_name(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
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
    i=read_attribute(:image)
    if i && i.include?('http')
      i
    elsif i
      "/assets/"+i
    else
      ""
    end
end

end
