class AddThingIdToPostsSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :thing_id, :integer
  end
end
