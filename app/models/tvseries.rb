class Tvseries < Thing
has_many :episodes
accepts_nested_attributes_for :episodes
#has_many :tvserieshaveactors, through: :episodes, source: :tvserieshaveactors
has_many :surnames, through: :tvserieshaveactors, source: :surnames
def everyrolesbyactor(aid)
episodes.joins(:surnames).select('episodes.*, surnames.name as surname').group('episodes.saison', 'episodes.ep').order('episodes.saison', 'episodes.ep')
end
has_and_belongs_to_many :places, :join_table => :tvserieshaveplaces
translates :name
  has_many :attitudetvseries,  foreign_key: 'person_id'
has_many :tvserieshaveepochs
has_many :epochs, through: :tvserieshaveepochs


  has_many :tvserieshaveactors
has_many :togethertvseriesratings, through: :tvserieshaveactors
has_many :tvserieshavecouples, through: :tvserieshaveactors
accepts_nested_attributes_for :tvserieshaveactors, allow_destroy: true
  has_many :actors, :through => :tvserieshaveactors, class_name: "Person"
def myidolcomments
Idolcomment.where(tvserieshaveactor: self.tvserieshaveactors)
end
  def addanactor=(id)
    self.actors << Person.where(id: id)
  end
  def self.findbyname(n)
    if n.to_s.length > 0
    o="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])

    else
    []
    end
  end

  def linkto
    self.attitude || self.post
  end
        def self.findbyid(o)
                where("id"=>o)
        end

end
