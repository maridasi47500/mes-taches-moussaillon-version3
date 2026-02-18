class AddPlaceIdToEventsEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events_events, :place_id, :integer
  end
end
