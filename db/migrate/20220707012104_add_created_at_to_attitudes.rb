class AddCreatedAtToAttitudes < ActiveRecord::Migration[6.0]
  def change
    add_column :attitudes, :created_at, :datetime
    add_column :attitudes, :updated_at, :datetime
  end
end
