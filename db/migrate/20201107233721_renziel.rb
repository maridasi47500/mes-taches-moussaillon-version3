class Renziel < ActiveRecord::Migration[6.0]
  def change
    rename_table :friends, :acquaintances_of_my_acquaintances
  end
end
