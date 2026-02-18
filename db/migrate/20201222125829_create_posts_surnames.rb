class CreatePostsSurnames < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_surnames do |t|
      t.integer :post_id
      t.integer :surname_id
    end
  end
end
