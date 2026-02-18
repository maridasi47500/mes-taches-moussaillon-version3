class Userhaveclothing < ApplicationRecord
belongs_to :clothing
belongs_to :user
validates_uniqueness_of :clothing_id, scope: :user_id

end
