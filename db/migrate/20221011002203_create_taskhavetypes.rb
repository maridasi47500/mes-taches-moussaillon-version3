class CreateTaskhavetypes < ActiveRecord::Migration[6.0]
  def change
    create_table :taskhavetypes do |t|
      t.integer :task_id
      t.integer :tasktype_id
    end
  end
end
