class Editticketsttable < ActiveRecord::Migration[6.0]
  def change
rename_column :tickets, :textcontent, :content_en
add_column :tickets, :content_fr, :text
add_column :tickets, :content_de, :text


  end
end
