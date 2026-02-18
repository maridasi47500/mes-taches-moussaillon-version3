class Removecol < ActiveRecord::Migration[6.0]
  def change
    remove_column :acquaintances, :usurpation_id
  end
end
