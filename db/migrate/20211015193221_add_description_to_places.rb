class AddDescriptionToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :description, :text
    add_column :places, :country_id, :integer
    add_column :places, :longitude, :string
    add_column :places, :latitude, :string
  end
end
