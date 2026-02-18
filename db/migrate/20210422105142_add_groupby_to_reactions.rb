class AddGroupbyToReactions < ActiveRecord::Migration[6.0]
  def change
    add_column :reactions, :groupby, :integer
  end
end
