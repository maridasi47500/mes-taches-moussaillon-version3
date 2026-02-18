class CreateRobot < ActiveRecord::Migration[6.0]
  def change
    create_table :rrobots do |t|
      t.integer :user_id
      t.integer :person_id
    end
    create_table :rcars do |t|
      t.integer :user_id
      t.integer :person_id
    end
  end
end
