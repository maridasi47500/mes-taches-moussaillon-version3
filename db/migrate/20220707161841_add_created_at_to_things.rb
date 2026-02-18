class AddCreatedAtToThings < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :created_at, :datetime
    add_column :things, :updated_at, :datetime
  end
end
