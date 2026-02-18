class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :city_id
      t.integer :country_id
      t.integer :state_id
      t.text :address
      t.integer :place_id

      t.timestamps
    end
  end
end
