require 'yaml'
require "open-uri"
require 'openssl'
require 'nokogiri'

require 'assets/photos'
require "./file"
class Photo < ApplicationRecord
has_and_belongs_to_many :personhavelifestates, :join_table => :personhavelifestateshavephotos

has_many :lifestates, :through => :personhavelifestates
has_many :somepeople, :through => :personhavelifestates, source: :person

def self.findbyid(x)
where(id: x)
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

where(['name like ? or title like ? or link like ?',o,o,o])
end
has_many :photoshavethings
has_many :things, :through => :photoshavethings
def self.nbpages
(all.length / 10).to_i
end
def self.bypage(i)
all.limit(10).offset(i * 10)
end


 has_many :photohavesailors
 has_many :photocomments

 accepts_nested_attributes_for :photoshavethings
 accepts_nested_attributes_for :photohavesailors
 accepts_nested_attributes_for :photocomments

 has_many :sailors, through: :photohavesailors, source: :person
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :authors, class_name: "User"
  has_and_belongs_to_many :contents
has_and_belongs_to_many :albums, :join_table => :albumshavephotos

def nextphoto
phot=albums[0].photo_ids
range=phot.index(self.id)
Photo.find(phot[(range+1)].to_i) rescue nil || nil

end
def myname
name && name.length > 0 ? name : nil
end
def erreursailors
photohavesailors.any? {|x|x.errors.to_a.length > 0} || photohavesailors.length > 0
end
    def name=(file)
      if !file.is_a?(String)
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      if filename.length > 0
      self.write_attribute(:name, filename)
      end
      loc='photos'
      abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
      `mv #{pathfile} #{abs}`
      #Post.cloud([loc,filename].join('/'),abs)
      else
      self.write_attribute(:name, file)

       end

    end
    def file=(file)
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      if filename.length > 0
      self.write_attribute(:name, filename)
      end
      loc='photos'
      abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
      `mv #{pathfile} #{abs}`
      #Post.cloud([loc,filename].join('/'),abs)

    end
  def savefbphoto=(link)
      filename =link.split("?")[0].split('/').last
    open(link) do |image|
      File.open("#{Rails.root}/app/assets/photos/#{filename}", "wb") do |file|
        file.write(image.read)
      end
    end
    write_attribute(:name, filename)
    save
  end
  def self.newphotos
    Photos.new
    end
    def self.get_all

  
      @images=[]
      @albums=$data['albums']
      p @albums
      @dataalbums=@albums["data"]
      p @dataalbums
      0.upto(@dataalbums.length-1) do |nieme|
        p nieme
        if @dataalbums&& @dataalbums[nieme]&& @dataalbums[nieme]['photos']
          @dataalbums[nieme]['photos']['data'].each do |image|
              @images.push(image['picture'])
          end
        end
      end
      @images
    rescue LoadError
      p "le fichier n'existe pas ou a été déplacé"
    end
    def self.get_one(n)
    p=Photos.new
          [p.getphotos[n.to_i]]
      
    end
    def myimagename
        j=name
        if j.include?('http')
            j
        else
            "/assets/"+j
        end
        
    end

end

