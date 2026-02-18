class Profilepicture < ApplicationRecord
  belongs_to :album, optional: true
  has_many :posts_surnames
  has_many :my_posts_surnames, foreign_key: 'profilepic_id', class_name: 'PostsSurname'
accepts_nested_attributes_for :my_posts_surnames, allow_destroy: true
    has_and_belongs_to_many :people, join_table: :currentprofilephotos, class_name: 'Person'
def self.withid(i)
where(id: i)
end
def self.find_by_name(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        where("lower(title) like ?",o)
end

def self.mypic(name)
  pic="%#{name.gsub(' ','%')}%"
  where('title like ? or image like ? or description like ?',pic,pic,pic)
end
def nameimage=(file)
          self.write_attribute(:title,file)

end
def nameimage
title
end
def name=(file)
  if !file.is_a?(String)
      pathfile = file.tempfile.path
      p pathfile
      name =file.original_filename
      ext = name.include?('.') ? name.split('.').last : ''
      filename = DateTime.now.to_s.gsub(/[^0-9]/, '')+'.'+ext
      self.write_attribute(:image,filename)
      loc='photos'
      abs="/app/assets/images/#{filename}"
      p abs
      #Post.cloud([loc,filename].join('/'),abs)
      `mv #{pathfile} #{Rails.root.to_s+abs}`
  else
          self.write_attribute(:image,file)

  end
end

 def image
  image2=self.read_attribute(:image)
  if image2.to_s.include?('http')

  image2 || "imagedelutilisateurinconnu.png"
  else
  "/assets/#{image2}" || "/assets/imagedelutilisateurinconnu.png"
  end
end


end
