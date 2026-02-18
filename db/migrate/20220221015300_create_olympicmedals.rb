class CreateOlympicmedals < ActiveRecord::Migration[6.0]
  def change
    create_table :olympicmedals do |t|
      t.integer :olympicresult_id
      t.string :color
      t.timestamps
    end
  end
end
