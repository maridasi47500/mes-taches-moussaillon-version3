class Loverrelation < ApplicationRecord
belongs_to :user
belongs_to :linkspouseperson
belongs_to :peoplerelation
validates_uniqueness_of :user_id, scope: [:linkspouseperson_id, :peoplerelation_id]
end
