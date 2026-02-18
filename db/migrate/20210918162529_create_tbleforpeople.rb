class CreateTbleforpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplelike do |t|
t.integer :person_id
t.integer :user_id
    end
    create_table :peopledontlike do |t|
t.integer :person_id
t.integer :user_id
    end
  end
end
