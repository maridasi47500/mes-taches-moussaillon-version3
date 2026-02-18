class Styleofmusic < Thing
has_and_belongs_to_many :listeners, :join_table => :styleofmusichavelisteners, class_name: 'Person'
has_and_belongs_to_many :practicers, :join_table => :styleofmusichavepracticers, class_name:'Person'
end
