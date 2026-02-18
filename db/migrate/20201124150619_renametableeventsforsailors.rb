class Renametableeventsforsailors < ActiveRecord::Migration[6.0]
  def change
rename_table :sailortasks, :sailorjobs
  end
end
