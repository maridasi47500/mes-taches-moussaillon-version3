class Setoftask < ApplicationRecord
  has_many :postlikecomments
  has_and_belongs_to_many :tasks, :join_table => :setoftaskhavetasks
end
