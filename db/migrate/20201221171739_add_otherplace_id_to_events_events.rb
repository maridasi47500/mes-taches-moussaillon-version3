class AddOtherplaceIdToEventsEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events_events, :otherplace_id, :integer
  end
end
