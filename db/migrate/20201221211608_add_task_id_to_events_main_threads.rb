class AddTaskIdToEventsMainThreads < ActiveRecord::Migration[6.0]
  def change
    add_column :events_main_threads, :task_id, :integer
  end
end
