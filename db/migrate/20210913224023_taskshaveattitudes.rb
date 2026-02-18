class Taskshaveattitudes < ActiveRecord::Migration[6.0]
  def change
    create_table :taskshaveattitudes do |t|
      t.integer :attitude_id
      t.integer :task_id
    end
    create_table :attitudeshavesailors do |t|
      t.integer :attitude_id
      t.integer :person_id
    end
  end
end
