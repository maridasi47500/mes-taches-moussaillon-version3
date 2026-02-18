class Otherinterestingperson < ApplicationRecord
belongs_to :posts_surname
belongs_to :other_posts_surname, class_name: "PostsSurname"
validates_uniqueness_of :posts_surname_id, scope: :other_posts_surname_id
end
