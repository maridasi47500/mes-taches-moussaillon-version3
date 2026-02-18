class CreatePostsaboutdishes < ActiveRecord::Migration[6.0]
  def change
    create_table :postsaboutdishes do |t|
      t.integer :post_id
      t.integer :dish_id
    end
  end
end
