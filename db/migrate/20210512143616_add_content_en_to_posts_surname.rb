class AddContentEnToPostsSurname < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :content_en, :text
    add_column :posts_surnames, :content_fr, :text
    add_column :posts_surnames, :content_de, :text
  end
end
