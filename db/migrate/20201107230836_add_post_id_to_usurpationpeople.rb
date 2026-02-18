class AddPostIdToUsurpationpeople < ActiveRecord::Migration[6.0]
  def change
    add_column :usurpationpeople, :post_id, :integer
    add_column :usurpationrelatedpeople, :post_id, :integer
  end
end
