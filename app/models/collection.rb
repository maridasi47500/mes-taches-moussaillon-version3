class Collection < Thing
has_many :collectionpeople
has_many :people, :through => :collectionpeople

end
