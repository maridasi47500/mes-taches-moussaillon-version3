class CreateOlympicsplits < ActiveRecord::Migration[6.0]
  def change
    create_table :olympicsplits do |t|
      t.integer :olympicresult_id
      t.integer :olympicdistance_id
      t.time :time
    end
    create_table :olympicdistances do |t|
      t.string :name
    end
  end
end
