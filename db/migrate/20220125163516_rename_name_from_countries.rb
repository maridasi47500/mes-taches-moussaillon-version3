class RenameNameFromCountries < ActiveRecord::Migration[6.0]
  def change
rename_column :countries, :name, :name_fr
add_column :countries, :name_en, :string
add_column :countries, :name_de, :string
  end
end
