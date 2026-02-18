class CreatePostpeopleonetimes < ActiveRecord::Migration[6.0]
  def change
    create_table :postpeopleonetimes do |t|
      t.integer :post_id
      t.integer :onetime_id
    end
  end
end
