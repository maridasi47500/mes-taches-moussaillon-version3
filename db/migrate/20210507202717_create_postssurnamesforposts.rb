class CreatePostssurnamesforposts < ActiveRecord::Migration[6.0]
  def change
    create_table :postssurnamesforposts do |t|
      t.integer :posts_surname_id
      t.integer :post_id
    end
  end
end
