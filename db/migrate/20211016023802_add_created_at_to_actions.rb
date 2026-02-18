class AddCreatedAtToActions < ActiveRecord::Migration[6.0]
  def change
    add_column :actions, :created_at, :datetime
    add_column :actions, :updated_at, :datetime
  end
end
