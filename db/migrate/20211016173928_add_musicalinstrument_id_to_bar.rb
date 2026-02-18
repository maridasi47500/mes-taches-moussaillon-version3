class AddMusicalinstrumentIdToBar < ActiveRecord::Migration[6.0]
  def change
    create_table :musicalkeys do |t|
      t.string :name_fr
      t.string :name_en
      t.string :name_de
      t.string :code_fr
      t.string :code_en
      t.string :code_de
      t.timestamps
    end

    create_table :barshavemusicalinstruments do |t|
      t.integer :bar_id
      t.integer :musicalinstrument_id
      t.timestamps
    end
    create_table :scoreshavekeys do |t|
      t.integer :musicalscore_id
      t.integer :musicalkey_id
      t.timestamps
    end
    create_table :barshavekeys do |t|
      t.integer :bar_id
      t.integer :musicalkey_id
      t.timestamps
    end
  end
end
