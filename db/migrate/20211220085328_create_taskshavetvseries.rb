class CreateTaskshavetvseries < ActiveRecord::Migration[6.0]
  def change
    create_table :taskshavetvseries do |t|
      t.integer :task_id
      t.integer :tvseries_id
    end
  end
end
