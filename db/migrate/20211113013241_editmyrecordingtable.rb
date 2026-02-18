class Editmyrecordingtable < ActiveRecord::Migration[6.0]
  def change
rename_column :recordings, :name, :name_fr
add_column :recordings, :name_de, :string
add_column :recordings, :name_en, :string
add_column :recordings, :name_it, :string
rename_column :recordings, :content, :content_fr
add_column :recordings, :content_de, :string
add_column :recordings, :content_en, :string
add_column :recordings, :content_it, :string

  end
end
