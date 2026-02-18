class ChangeColumnNullPosts < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:photos, :name, false)
  end
end
