class Content < ApplicationRecord
translates :content
has_and_belongs_to_many :comments
has_and_belongs_to_many :photos
accepts_nested_attributes_for :photos, allow_destroy: true
belongs_to :post, optional: true
 has_and_belongs_to_many :refrains, :join_table => :refrainshaverefrains
   has_and_belongs_to_many :couplets, :join_table => :coupletshavecontents

  def mycomposedcontent
    ref= refrains.length > 0 ? refrains[0] : nil
    c= couplets.length > 0 ? couplets[0] : nil
    if ref
      @c=ref.composedcontents.where(lineid: self.lineid)[0]
    end
    if c
      @c=c.composedcontents.where(lineid: self.lineid)[0]
    end
    @c ? @c.content : self.content
  end
  def photos=(files)
  photos =[]
  files.each do |file|
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      photos.push({name: filename})
      loc='photos'
      abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
    `mv #{pathfile} #{abs}`
    Post.cloud([loc,filename].join('/'),abs)
  end
  newphotos=self.photos.new(photos) #valeur temporaire de user_id
  #.add authors here

end

end
