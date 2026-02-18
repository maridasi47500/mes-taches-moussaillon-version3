class RenameAuthorFromBooks < ActiveRecord::Migration[6.0]
  def change
rename_column :books, :author, :author_id
change_column :books, :author_id, :integer
  end
end
