class CreateMytablename < ActiveRecord::Migration[6.0]
  def change
    create_table :mytablenames do |t|
      t.integer :scheduledtask_id
      t.integer :validation_id
    end
  end
end
