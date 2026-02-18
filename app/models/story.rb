class Story < ApplicationRecord
translates :title
belongs_to :user
has_many :heroadventures
accepts_nested_attributes_for :heroadventures, allow_destroy: true
def firstadventureid
heroadventures.firstadventure.id
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

end
