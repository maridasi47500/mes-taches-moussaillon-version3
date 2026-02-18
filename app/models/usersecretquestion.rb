class Usersecretquestion < ApplicationRecord
belongs_to :user
belongs_to :secretquestion
validates_uniqueness_of :user_id, scope: :secretquestion_id
has_many :answersecretquestions
has_many :secretanswers, through: :answersecretquestions
def blank?
!self.id
end
end
