class CreatePostsrefhistoricalcharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :postsrefhistoricalcharacters do |t|
      t.integer :historical_character_id
      t.integer :post_id
    end
  end
end
