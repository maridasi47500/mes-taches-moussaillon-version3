class CreateSailorhaveattitudesintasks < ActiveRecord::Migration[6.0]
  def change
    create_table :sailorhaveattitudesintasks do |t|
t.integer :attitude_id
t.integer :score
t.integer :person_id
t.integer :user_id
t.integer :task_id
    end
  end
end
