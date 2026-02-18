class AddCityofbirthIdToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :cityofbirth_id, :integer
  end
end
