class Emotion < ApplicationRecord
translates :name
def self.findbyid(i)
where(id: i)
end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    n2=I18n.transliterate(n1)
    where('lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ? or lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?',n1,n1,n1,n2,n2,n2)
    else
    []
    end
  end

  def image=(file)
      pathfile = file.tempfile.path
    filename =file.original_filename
    namefile="#{(rand()*100000000).to_i}.#{filename.split('.')[1]}"
      loc='photos'
abs="/app/assets/images/"+namefile
p abs
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:image,file.original_filename)

end
def image
    i=read_attribute(:image)
    if i && i.include?('http')
      i
    elsif i
      "/assets/"+i
    else
      "/assets/iconhumain.png"
    end
end

end
