class Renamecolumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :profilepictures, :person_id, :album_id
  end
end
