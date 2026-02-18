class CreatePostshavemymap < ActiveRecord::Migration[6.0]
  def change
    create_table :postshavemymaps do |t|
      t.integer :post_id
      t.integer :mymap_id
    end
  end
end
