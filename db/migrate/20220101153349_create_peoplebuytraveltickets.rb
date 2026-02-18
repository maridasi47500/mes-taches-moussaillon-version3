class CreatePeoplebuytraveltickets < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplebuytraveltickets do |t|
      t.integer :alias_id
      t.integer :travelticket_id
    end
    create_table :peoplebuyclothes do |t|
      t.integer :alias_id
      t.integer :clothing_id

    end
  end
end
