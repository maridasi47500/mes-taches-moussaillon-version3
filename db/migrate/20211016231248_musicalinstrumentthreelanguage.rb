class Musicalinstrumentthreelanguage < ActiveRecord::Migration[6.0]
  def change
rename_column :musicalinstruments, :name, :name_fr
add_column :musicalinstruments, :name_en, :string
add_column :musicalinstruments, :name_de, :string
  end
end
