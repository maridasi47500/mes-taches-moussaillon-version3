class CreatePostslinkedepochs < ActiveRecord::Migration[6.0]
  def change
    create_table :postslinkedepochs do |t|
      t.integer :post_id
      t.integer :epoch_id
    end
  end
end
