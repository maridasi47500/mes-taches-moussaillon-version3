class Renamecolumn222 < ActiveRecord::Migration[6.0]
  def change
rename_column :profilepictures, :nameimage, :title
rename_column :profilepictures, :name, :image
  end
end
