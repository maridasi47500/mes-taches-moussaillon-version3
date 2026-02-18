class AddPlaceIdToEventsPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :events_people, :place_id, :integer
  end
end
