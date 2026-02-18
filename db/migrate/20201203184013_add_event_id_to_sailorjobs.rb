class AddEventIdToSailorjobs < ActiveRecord::Migration[6.0]
  def change
    add_column :sailorjobs, :event_id, :integer
  end
end
