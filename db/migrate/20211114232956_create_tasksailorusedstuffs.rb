class CreateTasksailorusedstuffs < ActiveRecord::Migration[6.0]
  def change
    create_table :tasksailorusedstuffs do |t|
      t.integer :taskusedstuff_id
      t.integer :person_id
      t.timestamps
    end
  end
end
