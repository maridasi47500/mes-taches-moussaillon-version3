class RenameJinglscolumn < ActiveRecord::Migration[6.0]
  def change
rename_column :jingles, :name, :name_fr
add_column :jingles, :name_de, :string
add_column :jingles, :name_en, :string
add_column :jingles, :name_it, :string
rename_column :jingles, :content, :content_fr
add_column :jingles, :content_de, :string
add_column :jingles, :content_en, :string
add_column :jingles, :content_it, :string
  end
end
