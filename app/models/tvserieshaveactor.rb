class Tvserieshaveactor < ApplicationRecord
has_many :episodes
has_many :tvserieshaveactors, through: :episodes

has_many :togethertvseriesratings

  belongs_to :surname, optional: true
  belongs_to :tvseries
  belongs_to :actor, class_name: "Person", foreign_key: "person_id"
  accepts_nested_attributes_for :surname
  accepts_nested_attributes_for :tvseries
has_many :tvserieshavecouples


def self.findbyname(v)
k="%"+v.downcase.gsub(' ','%')+"%"
joins(:surname, :tvseries, :actor).select('people.*,surnames.*,things.*,tvserieshaveactors.id, people.name as actorname, surnames.name as charactername').group('tvserieshaveactors.id').having(['actorname like ? or charactername like ?',k,k])
end
def self.findbyid(v)
where(id: v)
end
end
