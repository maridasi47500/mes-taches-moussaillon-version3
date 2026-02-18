class AddCreatedAtToAboutsomeonegossips < ActiveRecord::Migration[6.0]
  def change
    add_column :aboutsomeonegossips, :created_at, :datetime
    add_column :aboutsomeonegossips, :updated_at, :datetime
  end
end
