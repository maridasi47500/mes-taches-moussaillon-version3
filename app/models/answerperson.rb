class Answerperson < ApplicationRecord
belongs_to :user
belongs_to :person
belongs_to :answer
belongs_to :question
validates_uniqueness_of :user_id, scope: [:person_id, :answer_id, :question_id]
end
