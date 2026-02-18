class CreateIslands < ActiveRecord::Migration[6.0]
  def change
    create_table :islands do |t|
      t.integer :address_id
      t.string :name

      t.timestamps
    end
    create_table :islandshavebeaches do |t|
      t.integer :beach_id
      t.integer :island_id

      t.timestamps
    end
  end
end
