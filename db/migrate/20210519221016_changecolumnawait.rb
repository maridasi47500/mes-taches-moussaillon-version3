class Changecolumnawait < ActiveRecord::Migration[6.0]
  def change
    change_column :proposals, :await, :string
  end
end
