class CreateOptontasks < ActiveRecord::Migration[6.0]
  def change
    create_table :optiontasks do |t|
      t.integer :task_id
      t.integer :followingtask_id
    end
  end
end
