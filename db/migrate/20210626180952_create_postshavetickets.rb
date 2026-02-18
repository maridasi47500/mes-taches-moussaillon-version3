class CreatePostshavetickets < ActiveRecord::Migration[6.0]
  def change
    create_table :postshavetickets do |t|
      t.integer :post_id
      t.integer :ticket_id
    end
  end
end
