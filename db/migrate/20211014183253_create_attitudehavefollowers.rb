class CreateAttitudehavefollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :attitudehavefollowers do |t|
      t.integer :attitude_id
      t.integer :person_id
    end
  end
end
