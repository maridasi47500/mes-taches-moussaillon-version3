class CreateTaskmucheffortsailor < ActiveRecord::Migration[6.0]
  def change
    create_table :taskmucheffortsailors do |t|
      t.integer :taskaction_id
      t.integer :person_id
      t.integer :task_id
      t.integer :user_id
      t.integer :intensity
    end
  end
end
