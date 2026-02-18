class Cantbelieve < ActiveRecord::Migration[6.0]
  def change
create_table :cantbelieve do |t|
t.integer :user_id
t.integer :post_id
t.integer :note
end
  end
end
