class CreateEventsRecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :events_recordings do |t|
      t.integer :event_id
      t.integer :recording_id
    end
  end
end
