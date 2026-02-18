class CreateGossipnotaboutwho < ActiveRecord::Migration[6.0]
  def change
    create_table :gossipnotaboutwhos do |t|
      t.integer :aboutsomeonegossip_id
      t.integer :person_id
    end
  end
end
