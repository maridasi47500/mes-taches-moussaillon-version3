class Changecolumnull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:people, :name, false)
    change_column_null(:people, :image, false)
  end
end
