class Emoticon < ApplicationRecord
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        where(["lower(title) like ?",o])

end
def self.findbyid(h)
where(id: h)
end

   def image
  image=self.read_attribute(:image)

  image && image.include?('http:') ? image : "/assets/#{image}"
end
def image=(file)
      pathfile = file.tempfile.path
    filename =file.original_filename
    namefile="#{(rand()*100000000).to_i}.#{filename.split('.')[1]}"
      loc='photos'
pathfirst=Rails.root.to_s+"/app/assets/images/"
abs=pathfirst+namefile
p abs
`mkdir -p #{pathfirst}; mv #{pathfile} #{abs};`
write_attribute(:image, namefile)
#save
    #image =Post.cloud([loc,filename].join('/'),pathfile)
    #if image
    #self.write_attribute(:image,image)
    #end
end


end
