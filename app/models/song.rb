class Song < Thing
has_and_belongs_to_many :people, :join_table => :songshavepeople
has_and_belongs_to_many :radios, :join_table => :songshaveradios
has_and_belongs_to_many :hotels, :join_table => :songshavehotels
has_many :musicalcompositionshavesongs
has_many :musicalcompositions, through: :musicalcompositionshavesongs
  has_and_belongs_to_many :refrains, :join_table => :songshaverefrain
  has_and_belongs_to_many :couplets, :join_table => :songshavecouplets
  accepts_nested_attributes_for :refrains, allow_destroy: true
  accepts_nested_attributes_for :couplets, allow_destroy: true
  has_many :contenurefrains, through: :refrains, source: :contents
  has_many :contenucouplets, through: :couplets, source: :contents
  accepts_nested_attributes_for :contenucouplets, allow_destroy: true
  accepts_nested_attributes_for :contenurefrains, allow_destroy: true
  has_many :contenucomporefrains, through: :refrains, source: :composedcontents
  has_many :contenucompocouplets, through: :couplets, source: :composedcontents
  accepts_nested_attributes_for :contenucompocouplets, allow_destroy: true
  accepts_nested_attributes_for :contenucomporefrains, allow_destroy: true
  has_many :artists, foreign_key: "song_id", class_name: "Artist"
  accepts_nested_attributes_for :artists
  def self.findbyid(n)
    where('id' => n)
  end
  def entercouplet(content)
            c=self.couplets.create!

        content.split("\r\n").select {|x|x.squish.strip != ""}.each_with_index do |t,i|
        c.contents.create("content_#{I18n.locale}" => t.squish.strip,lineid: i)
      end
    end
  def enterrefrain(content)
            c=self.refrains.create!

        content.split("\r\n").select {|x|x.squish.strip != ""}.each_with_index do |t,i|
        c.contents.create("content_#{I18n.locale}" => t.squish.strip,lineid: i)
      end
    end

  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    n2=I18n.transliterate(n1)
    sql='lower(things.name_de) like ? or lower(things.name_en) like ? or lower(things.name_fr) like ? or lower(artists.name) like ?'
    nbcolonne=4
    joins(:artists).group('things.id').select('artists.*, things.*').having([Array.new(2,sql).join(' or ')]+Array.new(nbcolonne,n1)+Array.new(nbcolonne,n2))
    else
    []
    end
  end

def mymusicalcompositions
musicalcompositions.group('musicalcompositions.id').joins(:composer).select('composers.*, musicalcompositions.*, musicalcompositions.id as mycompoid, composers.image as image1, composers.image as image2,composers.image as composerimage')
end
end
