class CreateAttitudeshavepeoplebuyclothes < ActiveRecord::Migration[6.0]
  def change
    create_table :attitudeshavepeoplebuyclothes do |t|
      t.integer :peoplebuyclothing_id
      t.integer :attitude_id
    end
    create_table :attitudeshavepeoplebuytraveltickets do |t|
      t.integer :peoplebuytravelticket_id
      t.integer :attitude_id
    end
  end
end
