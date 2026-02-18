class CreateGossipsbefores < ActiveRecord::Migration[6.0]
  def change
    create_table :gossipsbefores do |t|
      t.integer :gossip_id
      t.integer :reaction_id
    end
  end
end
