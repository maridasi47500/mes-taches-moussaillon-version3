class Hackertask < Task
has_and_belongs_to_many :tvseries, :join_table => :hthtvseries
end
