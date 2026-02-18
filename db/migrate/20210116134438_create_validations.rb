class CreateValidations < ActiveRecord::Migration[6.0]
  def change
    create_table :validations do |t|
      t.integer :scheduledtask_id
      t.string :name
    end
  end
end
