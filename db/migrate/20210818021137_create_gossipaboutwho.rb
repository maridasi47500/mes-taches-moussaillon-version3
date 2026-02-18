class CreateGossipaboutwho < ActiveRecord::Migration[6.0]
  def change
    create_table :gossipaboutwhos do |t|
      t.integer :aboutsomeonegossip_id
      t.integer :person_id
    end
  end
end
