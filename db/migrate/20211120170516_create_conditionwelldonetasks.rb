class CreateConditionwelldonetasks < ActiveRecord::Migration[6.0]
  def change
    create_table :conditionwelldonetasks do |t|
      t.integer :sailorjob_id
      t.integer :othersailorjob_id
    end
  end
end
