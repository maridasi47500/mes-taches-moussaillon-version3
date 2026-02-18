class CreateWorktwoshavetickets < ActiveRecord::Migration[6.0]
  def change
    create_table :worktwoshavetickets do |t|
      t.integer :worktwo_id
      t.integer :ticket_id
    end
    create_table :linkspousehavetickets do |t|
      t.integer :linkspouseperson_id
      t.integer :ticket_id
    end
    create_table :linkfamilyhavetickets do |t|
      t.integer :linkfamilyperson_id
      t.integer :ticket_id
    end
  end
end
