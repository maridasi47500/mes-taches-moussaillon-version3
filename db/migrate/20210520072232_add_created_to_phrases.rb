class AddCreatedToPhrases < ActiveRecord::Migration[6.0]
  def change
    add_column :phrases, :created, :datetime
  end
end
