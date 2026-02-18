class Renametaskcolumn < ActiveRecord::Migration[6.0]
  def change
rename_column :tasks, :name, :name_en
add_column :tasks, :name_fr, :string
add_column :tasks, :name_de, :string
  end
end
