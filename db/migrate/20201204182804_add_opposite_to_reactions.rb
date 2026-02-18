class AddOppositeToReactions < ActiveRecord::Migration[6.0]
  def change
    add_column :reactions, :opposite, :boolean
  end
end
