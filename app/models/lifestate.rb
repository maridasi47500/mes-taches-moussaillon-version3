class Lifestate < Thing
has_many :personhavelifestates
has_many :people, :through => :personhavelifestates
end
