class Lovedontlovetasks < ActiveRecord::Migration[6.0]
  def change
create_table :liketask do |t|
t.integer :task_id
t.integer :user_id
end
create_table :dontliketask do |t|
t.integer :task_id
t.integer :user_id
end
  end
end
