class Job < ApplicationRecord
has_many :jobusedstuffs
has_many :things, through: :jobusedstuffs
def thingsisaid(userid)
jobusedstuffs.where(user_id: userid)

end
  translates :name
has_many :peoplehavejobs
has_many :people, through: :peoplehavejobs

def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
end

def self.findbyid(i)
where(id: i)
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

end
