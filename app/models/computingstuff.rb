class Computingstuff < Artobject
has_many :peopleknowcomputingstuffs
has_many :people, through: :peopleknowcomputingstuffs

end
