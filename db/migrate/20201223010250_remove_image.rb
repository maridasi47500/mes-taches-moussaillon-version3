class RemoveImage < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts_surnames,:image
  end
end
