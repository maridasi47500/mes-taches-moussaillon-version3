class CreatePostshaveaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :postshaveaddresses do |t|
      t.integer :address_id
      t.integer :post_id
    end
  end
end
