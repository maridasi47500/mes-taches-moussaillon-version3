class RenameAuthorIdFromUsurpationsToUsurpatedId < ActiveRecord::Migration[6.0]
  def change
    rename_column :usurpations, :author_id, :usurpation_id
  end
end
