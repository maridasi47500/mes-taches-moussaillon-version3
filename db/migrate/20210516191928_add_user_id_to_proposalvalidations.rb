class AddUserIdToProposalvalidations < ActiveRecord::Migration[6.0]
  def change
    add_column :proposalvalidations, :user_id, :integer
  end
end
