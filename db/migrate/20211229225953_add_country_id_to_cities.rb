class AddCountryIdToCities < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :country_id, :integer
    add_column :cities, :state_id, :integer
    add_column :cities, :nationality_id, :integer
  end
end
