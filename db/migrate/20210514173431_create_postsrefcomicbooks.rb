class CreatePostsrefcomicbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :postsrefcomicbooks do |t|
      t.integer :post_id
      t.integer :comicbook_id
    end
  end
end
