class AddCreatedAtToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :created_at, :datetime
    add_column :people, :updated_at, :datetime
  end
end
