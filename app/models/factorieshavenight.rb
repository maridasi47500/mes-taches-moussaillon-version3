class Factorieshavenight < ApplicationRecord
belongs_to :factory
belongs_to :restaurant
belongs_to :hotel
belongs_to :dish
belongs_to :alias
belongs_to :laundryjiramaperson
validates_uniqueness_of :factory_id, scope: [:restaurant_id,:hotel_id,:dish_id,:alias_id,:laundryjiramaperson_id]
end
