class CreateGossipsforpostsfromsomeone < ActiveRecord::Migration[6.0]
  def change
    create_table :gossipsforpostsfromsomeones do |t|
      t.integer :fromsomeonegossip_id
      t.integer :post_id
    end
  end
end
