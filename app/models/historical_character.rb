class HistoricalCharacter < ApplicationRecord
  def image=(file)
      pathfile = file.tempfile.path
    filename =file.original_filename
    namefile="#{(rand()*100000000).to_i}.#{filename.split('.')[1]}"
      loc='photos'
abs="/app/assets/images/"+namefile
p abs
    image =Post.cloud([loc,filename].join('/'),pathfile)
    if image
    self.write_attribute(:image,image)
    end
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
