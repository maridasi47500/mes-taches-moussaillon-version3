class AddTaskIdToEventsPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :events_people, :task_id, :integer
  end
end
