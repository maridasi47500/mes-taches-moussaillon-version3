class CreatePostsandemails < ActiveRecord::Migration[6.0]
  def change
    create_table :postsandemails do |t|
      t.integer :email_id
      t.integer :post_id
    end
  end
end
