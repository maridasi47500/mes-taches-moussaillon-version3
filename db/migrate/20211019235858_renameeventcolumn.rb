class Renameeventcolumn < ActiveRecord::Migration[6.0]
  def change
rename_column :events, :name, :name_en
add_column :events, :name_fr, :string
add_column :events, :name_de, :string

  end
end
