class CreatePostsrefwebpages < ActiveRecord::Migration[6.0]
  def change
    create_table :postsrefwebpages do |t|
      t.integer :webpage_id
      t.integer :post_id
    end
  end
end
