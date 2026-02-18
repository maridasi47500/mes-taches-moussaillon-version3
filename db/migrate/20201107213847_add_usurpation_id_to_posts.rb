class AddUsurpationIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :usurpation_id, :integer
  end
end
