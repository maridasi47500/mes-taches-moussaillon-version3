class AddImageToPostsSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :image, :file
  end
end
