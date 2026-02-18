class Factory < Thing
has_many :factorieshavenights
accepts_nested_attributes_for :factorieshavenights, reject_if: :all_blank
has_many :factorieshaveworkers
has_many :workers, :through => :factorieshaveworkers, source: :person
end
