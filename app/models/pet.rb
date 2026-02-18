class Pet < Thing
has_many :petshaveowners
has_many :people, :through => :petshaveowners
end
