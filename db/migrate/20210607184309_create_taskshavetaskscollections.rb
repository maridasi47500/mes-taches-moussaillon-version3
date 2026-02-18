class CreateTaskshavetaskscollections < ActiveRecord::Migration[6.0]
  def change
    create_table :taskshavetaskscollections do |t|
      t.integer :taskcollection_id
      t.integer :task_id
    end
  end
end
