class Twopeoplehavecity < ApplicationRecord
belongs_to :twoperson
belongs_to :city

validates_uniqueness_of :city_id, scope: :twoperson_id
end
