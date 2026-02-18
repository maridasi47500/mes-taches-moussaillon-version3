class CreateSalutmilitaires < ActiveRecord::Migration[6.0]
  def change
    create_table :salutmilitaires do |t|
      t.integer :laundryjiramaperson_id
      t.integer :otherlaundryjiramaperson_id
      t.timestamps
    end

    create_table :factorieshavenights do |t|
      t.integer :factory_id
      t.integer :hotel_id
      t.integer :restaurant_id
      t.integer :dish_id
      t.integer :alias_id
      t.integer :laundryjiramaperson_id
      t.timestamps
    end
    create_table :factorieshavenightshavesoldiers do |t|
      t.integer :salutmilitaire_id
      t.integer :laundryjiramaperson_id
      t.timestamps
    end
  end
end
