class RenameTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :usurpationpeople, :acquaintances
    rename_table :usurpationrelatedpeople, :friends
    
  end
end
