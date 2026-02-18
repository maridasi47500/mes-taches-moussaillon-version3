class AddCityIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :city_id, :integer
    add_column :users, :place_id, :integer
    add_column :users, :job_id, :integer
  end
end
