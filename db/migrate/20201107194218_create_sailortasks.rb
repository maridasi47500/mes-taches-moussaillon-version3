class CreateSailortasks < ActiveRecord::Migration[6.0]
  def change
    create_table :sailortasks do |t|
      t.integer :person_id
      t.integer :task_id
    end
  end
end
