class CreateAboutsomeonegossipshavetvseries < ActiveRecord::Migration[6.0]
  def change
    create_table :aboutsomeonegossipshavetvseries do |t|
      t.integer :aboutsomeonegossip_id
      t.integer :tvseries_id
    end
  end
end
