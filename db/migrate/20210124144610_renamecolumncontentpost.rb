class Renamecolumncontentpost < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :content, :content_fr
    add_column :posts, :content_en, :text
  end
end
