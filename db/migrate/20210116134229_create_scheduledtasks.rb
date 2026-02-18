class CreateScheduledtasks < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduledtasks do |t|
      t.datetime :date_and_time
      t.string :name
      t.integer :person_id

      t.timestamps
    end
  end
end
