class Navettepersonarmycompagny < ApplicationRecord
belongs_to :personarmycompagny
belongs_to :navette
validates_uniqueness_of :personarmycompagny_id,scope: :navette_id
end
