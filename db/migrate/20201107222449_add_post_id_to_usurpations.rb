class AddPostIdToUsurpations < ActiveRecord::Migration[6.0]
  def change
    add_column :usurpations, :post_id, :integer
  end
end
