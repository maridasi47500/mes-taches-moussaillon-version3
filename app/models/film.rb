class Film < ApplicationRecord
has_and_belongs_to_many :places, :join_table => :filmshaveplaces
has_many :phavefilms
accepts_nested_attributes_for :phavefilms
has_many :actors, :through => :phavefilms, source: :person
has_many :filmhavecouples, through: :phavefilms
has_many :filmhaveepochs
has_many :epochs, :through => :filmhaveepochs

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
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
    where('lower(title) like ?',n1)
    else
    []
    end
  end
  def self.findbyid(g)
    where(id: g)
  end




end
