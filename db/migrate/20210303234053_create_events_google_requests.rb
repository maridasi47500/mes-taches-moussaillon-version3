class CreateEventsGoogleRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :events_google_requests do |t|
      t.integer :event_id
      t.integer :google_request_id
    end
  end
end
