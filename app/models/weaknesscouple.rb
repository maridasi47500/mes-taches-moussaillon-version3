class Weaknesscouple < ApplicationRecord
      belongs_to :person
      belongs_to :force, foreign_key: 'heroattitude_id', class_name: 'Strength'
      belongs_to :weakness, foreign_key: 'otherheroattitude_id'
      belongs_to :otherperson, foreign_key: 'otherperson_id', class_name: "Person"
      validates_uniqueness_of :person_id, scope: [:heroattitude_id,:otherheroattitude_id,:otherperson_id]

end
