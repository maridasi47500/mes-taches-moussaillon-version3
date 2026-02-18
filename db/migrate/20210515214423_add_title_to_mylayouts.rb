class AddTitleToMylayouts < ActiveRecord::Migration[6.0]
  def change
    add_column :mylayouts, :title, :string
  end
end
