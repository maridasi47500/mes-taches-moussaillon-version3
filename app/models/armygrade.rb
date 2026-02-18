class Armygrade < ApplicationRecord
def self.chooseone
all.sample
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        where(["lower(nom) like ? or lower(appellation) like ?",o,o])
end
def self.findbyid(h)
where(id: h)
end

def self.grades
all.pluck("nom")
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
