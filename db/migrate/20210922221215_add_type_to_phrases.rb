class AddTypeToPhrases < ActiveRecord::Migration[6.0]
  def change
 add_column :phrases, :type, :string
rename_column :phrases, :content, :content_en
add_column :phrases, :content_fr, :text
add_column :phrases, :content_de, :text
  end
end
