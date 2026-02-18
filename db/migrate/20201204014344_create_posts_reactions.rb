class CreatePostsReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_reactions do |t|
      t.integer :post_id
      t.integer :reaction_id
    end
  end
end
