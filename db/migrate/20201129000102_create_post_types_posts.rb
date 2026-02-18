class CreatePostTypesPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :post_types_posts do |t|
      t.integer :post_id
      t.integer :post_type_id
    end
  end
end
