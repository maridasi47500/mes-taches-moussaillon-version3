class Storysentencestoryhaveperson < ApplicationRecord
belongs_to :severalpeoplestory
belongs_to :posts_surname
validates_uniqueness_of :severalpeoplestory_id, scope: :posts_surname_id

end