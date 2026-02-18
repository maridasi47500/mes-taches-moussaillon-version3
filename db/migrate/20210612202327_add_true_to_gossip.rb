class AddTrueToGossip < ActiveRecord::Migration[6.0]
  def change
    add_column :gossips, :true, :boolean
  end
end
