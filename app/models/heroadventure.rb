class Heroadventure < ApplicationRecord
belongs_to :previousadventure, class_name: 'Heroadventure', foreign_key: 'previousstoryevent_id',optional: true
has_one :nextadventure, class_name: 'Heroadventure', foreign_key: 'previousstoryevent_id'
belongs_to :story
belongs_to :user
translates :content
def self.firstadventure
j=select('*').map do |t|
h=t
while h && h.previousadventure
h=h.previousadventure
end
h
end
j.inject(Hash.new(0)) { |h,v| h[v] += 1; h }.to_a[0][0]

end
        def self.findbyid(o)
                where("id"=>o)
        end
        def self.findbyname(n)
              o='%'+n.to_s.gsub(' ','%').downcase+'%'
                where(["lower(content_fr) like ? or lower(content_en) like ? or lower(content_de) like ?",o,o,o])
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
