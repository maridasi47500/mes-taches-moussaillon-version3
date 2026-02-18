class AddAwaitToProposals < ActiveRecord::Migration[6.0]
  def change
    add_column :proposals, :await, :boolean
  end
end
