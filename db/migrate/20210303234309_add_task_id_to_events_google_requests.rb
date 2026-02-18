
class AddTaskIdToEventsGoogleRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :events_google_requests, :task_id, :integer
  end
end
