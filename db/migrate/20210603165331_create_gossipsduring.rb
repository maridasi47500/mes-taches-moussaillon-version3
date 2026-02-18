class CreateGossipsduring < ActiveRecord::Migration[6.0]
  def change
    create_table :gossipsdurings do |t|
      t.integer :gossip_id
      t.integer :reaction_id
    end
  end
end
