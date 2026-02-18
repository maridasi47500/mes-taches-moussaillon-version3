class Webpage < ApplicationRecord
has_many :webpageshavecomments
has_many :comments, through: :webpageshavecomments
accepts_nested_attributes_for :comments
before_validation :createdme, on: :create
def createdme
self.created_at=DateTime.now
end
before_validation :updateme, on: :update
def updateme
self.updated_at=DateTime.now
end
def self.todays
where("created_at > ?", DateTime.now.beginning_of_day)
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
