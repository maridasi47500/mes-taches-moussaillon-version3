class Changecolumgossip < ActiveRecord::Migration[6.0]
  def change
rename_column :aboutsomeonegossips, :content, :content_fr
add_column :aboutsomeonegossips, :content_en, :text
add_column :aboutsomeonegossips, :content_de, :text
  end
end
