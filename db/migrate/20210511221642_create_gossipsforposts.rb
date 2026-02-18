class CreateGossipsforposts < ActiveRecord::Migration[6.0]
  def change
    create_table :gossipsforposts do |t|
      t.integer :aboutsomeonegossip_id
      t.integer :post_id
    end
  end
end
