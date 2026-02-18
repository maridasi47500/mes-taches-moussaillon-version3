class Completetask < ApplicationRecord
belongs_to :task
belongs_to :user
belongs_to :person
belongs_to :otherperson, class_name: 'Person'
belongs_to :emotion
end
