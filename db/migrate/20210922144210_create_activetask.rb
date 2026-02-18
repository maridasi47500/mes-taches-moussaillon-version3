class CreateActivetask < ActiveRecord::Migration[6.0]
  def change
    create_table :activetasks do |t|
      t.integer :user_id
      t.integer :task_id
    end
  end
end
