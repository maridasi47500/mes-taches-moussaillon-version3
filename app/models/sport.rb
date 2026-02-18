class Sport < Thing
has_and_belongs_to_many :people, :join_table => :peoplehavesports
  
end
