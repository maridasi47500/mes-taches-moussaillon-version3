class AddTypeToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :type, :string
    add_column :mymapscoords, :place_id, :integer
  end
end
