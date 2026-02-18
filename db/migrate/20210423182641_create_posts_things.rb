class CreatePostsThings < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_things do |t|
      t.integer :tvseries_id
      t.integer :post_id
    end
  end
end
