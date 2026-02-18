class AddMessagecacheToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :messagecache, :text
  end
end
