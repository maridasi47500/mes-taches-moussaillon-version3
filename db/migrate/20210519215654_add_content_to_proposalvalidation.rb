class AddContentToProposalvalidation < ActiveRecord::Migration[6.0]
  def change
    add_column :proposalvalidations, :content, :text
  end
end
