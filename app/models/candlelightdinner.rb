class Candlelightdinner < ApplicationRecord
belongs_to :task, foreign_key: 'tomorrow_morning_task'
belongs_to :person
belongs_to :otherperson, class_name: 'Person'
validates_uniqueness_of :date, scope: [:task, :person_id, :otherperson_id, :tomorrow_morning_task]
end
