class Dish < Thing
  has_and_belongs_to_many :countries, :join_table => :foodhavecountries
  
end
