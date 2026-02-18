class CreateSavedtasksailor < ActiveRecord::Migration[6.0]
  def change
    create_table :savedtasksailors do |t|
      t.integer :person_id
      t.integer :task_id
      t.integer :user_id
    end
  end
end
