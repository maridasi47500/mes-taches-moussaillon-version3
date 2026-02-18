class CreateCommenttasks < ActiveRecord::Migration[6.0]
  def change
    create_table :commenttasks do |t|
      t.integer :task_id
      t.integer :user_id
      t.text :content
    end
  end
end
