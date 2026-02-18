class CreatePostsPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_posts do |t|
      t.integer :otherpost_id
      t.integer :post_id
    end
  end
end
