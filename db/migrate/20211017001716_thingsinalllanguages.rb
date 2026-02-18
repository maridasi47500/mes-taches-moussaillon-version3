class Thingsinalllanguages < ActiveRecord::Migration[6.0]
  def change
rename_column :things, :name, :name_fr
add_column :things, :name_de, :string
add_column :things, :name_en, :string
  end
end
