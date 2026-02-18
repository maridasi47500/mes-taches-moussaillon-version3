
class CreatePostsaboutthings < ActiveRecord::Migration[6.0]
  def change
    create_table :postsaboutthings do |t|
      t.integer :post_id
      t.integer :thing_id
    end
  end
end
