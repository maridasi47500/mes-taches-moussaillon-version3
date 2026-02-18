class CreateSailorjobhaveclothes < ActiveRecord::Migration[6.0]
  def change
    create_table :sailorjobhaveclothes do |t|
      t.integer :sailorjob_id
      t.integer :clothing_id
    end
  end
end
