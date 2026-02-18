class CreatePostshavesocialmovements < ActiveRecord::Migration[6.0]
  def change
    create_table :postshavesocialmovements do |t|
      t.integer :post_id
      t.integer :socialmovement_id
    end
  end
end
