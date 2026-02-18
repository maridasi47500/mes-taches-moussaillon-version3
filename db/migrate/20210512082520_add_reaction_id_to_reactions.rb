class AddReactionIdToReactions < ActiveRecord::Migration[6.0]
  def change
    add_column :reactions, :reaction_id, :integer
  end
end
