class CreateTasksailorusedstuffhavepeople < ActiveRecord::Migration[6.0]
  def change
    create_table :tasksailorusedstuffhavepeople do |t|
      t.integer :tasksailorusedstuff_id
      t.integer :person_id
    end
  end
end
