class Renamecolumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :epochs, :plce_id, :place_id
    change_column :epochs, :created_at, :datetime
    change_column :epochs, :end_at, :datetime
    change_column :epochs, :start_at, :datetime
    change_column :epochs, :country_id, :integer
    change_column :epochs, :place_id, :integer
    change_column :epochs, :state_id, :integer
    change_column :epochs, :city_id, :integer
    change_column :epochs, :nbtimes, :integer
    change_column :epochs, :updated_at, :datetime
    change_column :epochs, :description, :text
  end
end
