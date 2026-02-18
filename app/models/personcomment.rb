class Personcomment < ApplicationRecord
belongs_to :person
belongs_to :post
validates_uniqueness_of :person_id, scope: :post_id
end
