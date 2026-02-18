class Aboutsomeonegossip < ApplicationRecord
has_and_belongs_to_many :tvseries, :join_table => :aboutsomeonegossipshavetvseries
has_many :actors, through: :tvseries
translates :content
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(content_en) like ? or lower(content_fr) like ? or lower(content_de) like ?",o,o,o])
end
def self.todays
where("created_at > ? or updated_at > ?", DateTime.now.beginning_of_day, DateTime.now.beginning_of_day)
end
def self.nbpages
all.length / 10
end
def self.bypage(i)
all.limit(10).offset(i.to_i * 10).order(created_at: :desc)
end
def self.findbyid(i)
where(id: i)
end
has_many :secretoccupations

  has_many :dontunderstandgossips,  foreign_key: 'gossip_id'
  has_many :comprendpasgossips, :source => "user",:through => :dontunderstandgossips, class_name: 'User'
  has_many :likerumeurs,  foreign_key: 'gossip_id'
  has_many :aimegossips, :source => "user",:through => :likerumeurs, class_name: 'User'
  has_many :dontlikerumeurs, foreign_key: 'gossip_id'
  has_many :aimepasgossips, :source => "user", :through => :dontlikerumeurs,  class_name: 'User'

  has_many :readrumeurs, foreign_key: 'gossip_id'
  has_many :lugossips, :through => :readrumeurs, :source => "user", class_name: 'User'
  has_many :heardrumeurs, foreign_key: 'gossip_id'
  has_many :entendugossips, :through => :heardrumeurs, :source => "user", class_name: 'User'
  has_many :commentrumeurs, :foreign_key => "gossip_id"
has_many :reactionsgossips, through: :commentrumeurs, class_name: 'User', source: 'user'
  has_many :noterumeurs, :foreign_key => "gossip_id"
  has_many :notesgossips, through: :noterumeurs, class_name:'User', source: 'user'
#
def moy
n=noterumeurs.pluck(:note)
m=n.sum.to_f/n.length.to_f
m.to_s[0..2]
end
  has_and_belongs_to_many :posts, :join_table => :gossipsforposts
  has_and_belongs_to_many :anaphors, join_table: :explainmygossips                                                                                                             
  accepts_nested_attributes_for :anaphors, allow_destroy: true                                                                                                               
  has_and_belongs_to_many :beforegossips, join_table: :gossipsbefores, class_name: "Reaction", foreign_key: "gossip_id"                                                                                             
  accepts_nested_attributes_for :beforegossips, allow_destroy: true                                                                                                               
  has_and_belongs_to_many :duringgossips, join_table: :gossipsdurings, class_name: "Reaction", foreign_key: "gossip_id"                                                                                                    
  accepts_nested_attributes_for :duringgossips, allow_destroy: true                                                                                                               
  has_and_belongs_to_many :aftergossips, join_table: :gossipsafters, class_name: "Reaction", foreign_key: "gossip_id"                                                      
  accepts_nested_attributes_for :duringgossips, allow_destroy: true                                                                                                               
  belongs_to :reaction, optional: true
  has_many :gossipaboutwho
  has_many :aboutthosepeople, through: :gossipaboutwho, source: :person
 def self.findgosbycontent(n)

    n1="%#{n.downcase.gsub(' ','%')}%"
    Aboutsomeonegossip.where('lower(content) like ?',n1)

 end 
  def mostrecentreactions
    Reaction.where(id: reaction_id)+Reaction.order(updated_at: :desc).first(10)
  end


end
