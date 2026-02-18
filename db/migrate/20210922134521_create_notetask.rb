class CreateNotetask < ActiveRecord::Migration[6.0]
  def change
    create_table :notetasks do |t|
     t.integer :note
     t.integer :task_id
     t.integer :user_id
    end
    create_table :noterealizedtasks do |t|
     t.integer :note
     t.integer :task_id
     t.integer :user_id
    end
  end
end
