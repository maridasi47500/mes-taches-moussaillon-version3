class Factoryservice < Thing
has_many :factorieshaveservices
has_many :factories, through: :factorieshaveservices
has_many :factoriesservicehaveemployees
has_many :people, through: :factoriesservicehaveemployees

end
