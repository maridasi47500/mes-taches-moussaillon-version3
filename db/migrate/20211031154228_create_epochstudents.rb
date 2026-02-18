class CreateEpochstudents < ActiveRecord::Migration[6.0]
  def change
    create_table :epochstudents do |t|
      t.integer :person_id
      t.integer :grade_id
      t.integer :epoch_id
    end
  end
end
