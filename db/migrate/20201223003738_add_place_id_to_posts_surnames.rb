class AddPlaceIdToPostsSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :place_id, :integer
  end
end
