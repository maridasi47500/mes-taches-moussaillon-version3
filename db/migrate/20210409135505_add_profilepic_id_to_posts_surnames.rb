class AddProfilepicIdToPostsSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :profilepic_id, :integer
  end
end
