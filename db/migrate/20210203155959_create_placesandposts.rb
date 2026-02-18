class CreatePlacesandposts < ActiveRecord::Migration[6.0]
  def change
    create_table :placesandposts do |t|
      t.integer :place_id
      t.integer :post_id
    end
  end
end
