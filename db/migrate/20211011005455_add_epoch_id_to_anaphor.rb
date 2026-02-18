class AddEpochIdToAnaphor < ActiveRecord::Migration[6.0]
  def change
    add_column :anaphors, :epoch_id, :integer
  end
end
