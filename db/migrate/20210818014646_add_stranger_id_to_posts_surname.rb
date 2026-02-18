class AddStrangerIdToPostsSurname < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :stranger_id, :integer
  end
end
