class Musicalcomposition < ApplicationRecord
has_many :musicalcompositionshavesongs
has_many :songs, through: :musicalcompositionshavesongs

  has_many :refrainhavecomposedcontents
  has_many :refrains, through: :refrainhavecomposedcontents
  has_many :couplethavecomposedcontents
  has_many :couplets, :through => :couplethavecomposedcontents
  belongs_to :composer, optional: true
  has_many :compohaverecipients
  has_many :recipients, :through => :compohaverecipients, source: :person
  has_many :surnames, :through => :compohaverecipients, source: :surname
  accepts_nested_attributes_for :composer
  accepts_nested_attributes_for :compohaverecipients, allow_destroy: true
  def self.findbyname(i)
    o='%'+i.downcase.gsub(' ','%')+'%'
    joins(:composer).select('composers.*,musicalcompositions.*').where(['lower(composers.name) like ? or lower(musicalcompositions.title) like ?',o,o])
  end
  def self.findbyid(h)
    where(id: h)
  end
  def machanson
  (self.couplets.select{|y| y.contents.length > 0}[0]||self.refrains.select{|y| y.contents.length > 0}[0]).songs[0]
  rescue
  self.songs[0]
  end
  def self.refrain(song,cid)
    joins('left join refrainhavecomposedcontents r on r.musicalcomposition_id = musicalcompositions.id').joins('left join couplethavecomposedcontents c on c.musicalcomposition_id = musicalcompositions.id').joins('left join paragraphs couplet on couplet.id = c.couplet_id').joins('left join paragraphs refrain on refrain.id = r.refrain_id').joins('left join songshaverefrain r1 on r1.refrain_id = r.refrain_id').joins('left join songshavecouplets c1 on c1.couplet_id = c.couplet_id').joins('left join things s2 on s2.id = c1.song_id').joins('left join things s1 on s1.id = r1.song_id').where("r.refrain_id in (#{song.refrain_ids.map{|x|x.to_s}.join(',')}) or c.couplet_id in (#{song.couplet_ids.map{|x|x.to_s}.join(',')}) or musicalcompositions.id in (#{cid})").joins('left join composers co on co.id = musicalcompositions.composer_id').select('musicalcompositions.*,musicalcompositions.id as mycompoid, refrain.*, couplet.*, c1.*, r1.*,c.*, r.*,s1.*, s2.*, s1.id as s1id , s2.id as s2id,co.name as composername,co.image as composerimage, s1.image as image1, s2.image as image2')
  end
  def self.mycompo
    joins('left join refrainhavecomposedcontents r on r.musicalcomposition_id = musicalcompositions.id').joins('left join couplethavecomposedcontents c on c.musicalcomposition_id = musicalcompositions.id').joins('left join paragraphs couplet on couplet.id = c.couplet_id').joins('left join paragraphs refrain on refrain.id = r.refrain_id').joins('left join songshaverefrain r1 on r1.refrain_id = r.refrain_id').joins('left join songshavecouplets c1 on c1.couplet_id = c.couplet_id').joins('left join things s2 on s2.id = c1.song_id').joins('left join things s1 on s1.id = r1.song_id').joins('left join composers co on co.id = musicalcompositions.composer_id').select('musicalcompositions.*,musicalcompositions.id as mycompoid, refrain.*, couplet.*, c1.*, r1.*,c.*, r.*,s1.*, s2.*, s1.id as s1id , s2.id as s2id,co.name as composername,co.image as composerimage, s1.image as image1, s2.image as image2').where('s1.id is not null or s2.id is not null').to_a
  end
end
