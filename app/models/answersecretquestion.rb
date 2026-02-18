class Answersecretquestion < ApplicationRecord
belongs_to :usersecretquestion
belongs_to :secretanswer
validates_uniqueness_of :usersecretquestion_id, scope: :secretanswer_id
end
