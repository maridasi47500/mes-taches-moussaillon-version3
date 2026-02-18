class CreateTaskhasmanyaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :taskhasmanyaddresses do |t|
      t.integer :task_id
      t.integer :address_id
    end
  end
end
