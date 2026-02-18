class Peoplehaveweakness < ApplicationRecord
belongs_to :weakness
belongs_to :person
belongs_to :linkspouseperson
belongs_to :user
validates_uniqueness_of :user_id, scope: [:weakness_id, :person_id, :linkspouseperson_id]

end
