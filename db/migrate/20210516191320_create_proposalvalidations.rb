class CreateProposalvalidations < ActiveRecord::Migration[6.0]
  def change
    create_table :proposalvalidations do |t|
      t.boolean :validated
      t.integer :proposal_id
    end
  end
end
