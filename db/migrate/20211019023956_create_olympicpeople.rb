class CreateOlympicpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :olympicpeople do |t|
      t.integer :twoperson_id
      t.integer :skill_id
      t.integer :user_id
    end
    create_table :olympicpeoplehaveevents do |t|
      t.integer :olympicperson_id
      t.integer :event_id
    end
  end
end
