class Artistperson < ApplicationRecord
belongs_to :person
belongs_to :user
belongs_to :musicalinstrument, optional: true, foreign_key: 'artobject_id', class_name: 'Musicalinstrument'
belongs_to :programminglanguage, optional: true, foreign_key: 'artobject_id', class_name: 'Programminglanguage'
belongs_to :ustensile, optional: true, foreign_key: 'artobject_id', class_name: 'Ustensile'
belongs_to :artobject, optional: true, foreign_key: 'artobject_id'
validates :artobject_id, presence: true


end
