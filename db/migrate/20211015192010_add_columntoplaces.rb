class AddColumntoplaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, "city_id", :integer
    add_column :places, "place_id", :integer
    add_column :places, "state_id", :integer

  end
end
