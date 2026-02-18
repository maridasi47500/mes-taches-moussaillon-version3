class Concert < Task
has_many :musicianjobs
has_many :musicians, through: :musicianjobs, class_name: 'Person'
has_and_belongs_to_many :musicalcompositions, :join_table => :musicalcompositionsjobs, class_name: 'Musicalcomposition'
has_and_belongs_to_many :songs, :join_table => :concertshavesongs, class_name: 'Song'
has_and_belongs_to_many :musicalscores, :join_table => :concerthavemusicalscores, class_name: 'Musicalscore'
has_and_belongs_to_many :cities, :join_table => :concertshavecities
end
