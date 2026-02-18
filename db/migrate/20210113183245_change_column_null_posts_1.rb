class ChangeColumnNullPosts1 < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:photos, :name, true)

  end
end
