class CreateTasksworks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasksworks do |t|
t.integer :task_id
t.integer :worktwo_id
    end

  end
end
