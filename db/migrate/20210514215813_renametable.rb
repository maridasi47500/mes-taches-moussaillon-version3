class Renametable < ActiveRecord::Migration[6.0]
  def change
    rename_table :epoches, :epochs
  end
end
