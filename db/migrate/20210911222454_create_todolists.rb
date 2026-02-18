class CreateTodolists < ActiveRecord::Migration[6.0]
  def change
    create_table :todolists do |t|
      t.string :title
    end
    create_table :todolisthavesailors do |t|
      t.integer :task_id
      t.integer :person_id
    end
    create_table :todolisthavetasks do |t|
      t.integer :task_id
      t.integer :Num
      t.integer :todolist_id
    end
  end
end
