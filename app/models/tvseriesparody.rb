class Tvseriesparody < Thing
has_and_belongs_to_many :places, :join_table => :tvseriesparodieshaveplaces
has_many :tvseriesparodiehaveactors, foreign_key: 'film_id'
accepts_nested_attributes_for :tvseriesparodiehaveactors
has_many :actors, :through => :tvseriesparodiehaveactors, source: :person
has_many :tvseriesparodiehavecouples, through: :tvseriesparodiehaveactors
  def self.findbyname(n)
    if n.to_s.length > 0
    o="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])

    else
    []
    end
  end
  def self.findbyid(g)
    where(id: g)
  end


end
