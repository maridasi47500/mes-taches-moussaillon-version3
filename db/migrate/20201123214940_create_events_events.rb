class CreateEventsEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events_events do |t|
      t.integer :event_id
      t.integer :task_id
    end
  end
end
