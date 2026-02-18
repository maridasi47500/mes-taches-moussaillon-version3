class AddSportGroupIdToOlympicevents < ActiveRecord::Migration[6.0]
  def change
    create_table :olympicsports do |t|
      t.integer :sport_id
      t.integer :sport_group_id
      t.string :code
      t.timestamps
    end
    add_column :olympicevents, :olympicsport_id, :integer
end
end
