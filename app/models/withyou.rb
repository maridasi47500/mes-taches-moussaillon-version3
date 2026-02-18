class Withyou < ApplicationRecord
belongs_to :person
belongs_to :withorwithoutyou
validates_uniqueness_of :withorwithoutyou_id, scope: :person_id
end
