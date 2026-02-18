class CreateAnaphorsTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :anaphors_tasks do |t|
      t.integer :anaphor_id
      t.integer :task_id
    end
  end
end
