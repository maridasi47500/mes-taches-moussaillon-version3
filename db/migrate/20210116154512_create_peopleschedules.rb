class CreatePeopleschedules < ActiveRecord::Migration[6.0]
  def change
    create_table :peopleschedules do |t|
      t.integer :person_id
      t.integer :scheduledtask_id
    end
  end
end
