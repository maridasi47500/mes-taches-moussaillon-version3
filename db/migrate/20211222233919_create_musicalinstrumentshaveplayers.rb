class CreateMusicalinstrumentshaveplayers < ActiveRecord::Migration[6.0]
  def change
    create_table :musicalinstrumentshaveplayers do |t|
      t.integer :musicalinstrument_id
      t.integer :person_id
      t.timestamps
    end
  end
end
