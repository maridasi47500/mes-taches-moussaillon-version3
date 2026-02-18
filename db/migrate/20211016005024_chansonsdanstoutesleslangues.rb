class Chansonsdanstoutesleslangues < ActiveRecord::Migration[6.0]
  def change
rename_column :contents, :content, :content_fr
add_column :contents, :content_en, :text
add_column :contents, :content_de, :text

  end
end
