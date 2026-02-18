class Inlove < ApplicationRecord
belongs_to :person
belongs_to :user
belongs_to :otherperson, class_name: 'Person'
validates_uniqueness_of :person_id, scope: [:user_id, :otherperson_id]
end
