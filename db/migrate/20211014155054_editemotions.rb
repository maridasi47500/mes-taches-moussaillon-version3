class Editemotions < ActiveRecord::Migration[6.0]
  def change
rename_column :emotions, :name, :name_en
add_column :emotions, :name_fr, :string
add_column :emotions, :name_de, :string
  end
end
