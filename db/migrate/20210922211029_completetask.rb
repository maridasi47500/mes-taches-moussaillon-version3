class Completetask < ActiveRecord::Migration[6.0]
  def change
create_table :detailtasks do |t|
t.integer :task_id
t.text :content
end
create_table :completetasks do |t|
t.integer :person_id
t.integer :user_id
t.integer :task_id
t.integer :otherperson_id
t.integer :emotion_id
end
  end
end
