class Colocataire < ApplicationRecord
belongs_to :person
belongs_to :otherperson, class_name: 'Person'
has_many :colocataireshavetasks
has_many :tasks, through: :colocataireshavetasks
validates_uniqueness_of :person_id, scope: :otherperson_id

end
