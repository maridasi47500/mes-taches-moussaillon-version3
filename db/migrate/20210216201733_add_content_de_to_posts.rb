class AddContentDeToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :content_de, :text
  end
end
