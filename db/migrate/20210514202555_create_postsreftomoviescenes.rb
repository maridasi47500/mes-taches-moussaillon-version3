class CreatePostsreftomoviescenes < ActiveRecord::Migration[6.0]
  def change
    create_table :postsreftomoviescenes do |t|
      t.integer :moviescene_id
      t.integer :post_id
    end
  end
end
