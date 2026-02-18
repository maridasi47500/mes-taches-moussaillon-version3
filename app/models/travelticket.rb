class Travelticket < Thing
has_and_belongs_to_many :aliases, :join_table => :peoplebuytraveltickets
end
