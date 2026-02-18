class AddReactionIdToGossip < ActiveRecord::Migration[6.0]
  def change
    add_column :fromsomeonegossips, :reaction_id, :integer
    add_column :aboutsomeonegossips, :reaction_id, :integer
  end
end
