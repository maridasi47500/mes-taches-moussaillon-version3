class Petshaveowner < ApplicationRecord
belongs_to :person
belongs_to :pet
validates_uniqueness_of :person_id, scope: :pet_id
has_and_belongs_to_many :photos, :join_table => :petshaveownershavephotos
end
