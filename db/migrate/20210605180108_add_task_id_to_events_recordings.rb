class AddTaskIdToEventsRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :events_recordings, :task_id, :integer
  end
end
