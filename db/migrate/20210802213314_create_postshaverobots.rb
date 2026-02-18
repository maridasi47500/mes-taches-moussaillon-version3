class CreatePostshaverobots < ActiveRecord::Migration[6.0]
  def change
    create_table :postshaverobots do |t|
      t.integer :robot_id
      t.integer :post_id
    end
  end
end
