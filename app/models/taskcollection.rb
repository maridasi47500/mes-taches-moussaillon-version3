class Taskcollection < ApplicationRecord
  has_and_belongs_to_many :tasks, :join_table => :taskshavetaskscollections
  def image
    ""
  end
end
