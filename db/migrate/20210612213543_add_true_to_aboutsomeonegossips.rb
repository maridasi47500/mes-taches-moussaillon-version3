class AddTrueToAboutsomeonegossips < ActiveRecord::Migration[6.0]
  def change
    add_column :aboutsomeonegossips, :true, :boolean
  end
end
