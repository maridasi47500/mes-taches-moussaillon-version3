class AddCreatedAtUpdatedAtToReactions < ActiveRecord::Migration[6.0]
  def change
    add_column :reactions, :created_at, :datetime
    add_column :reactions, :updated_at, :datetime
  end
end
