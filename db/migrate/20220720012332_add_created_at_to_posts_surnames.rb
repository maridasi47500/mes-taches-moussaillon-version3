class AddCreatedAtToPostsSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :created_at, :datetime
    add_column :posts_surnames, :updated_at, :datetime
  end
end
