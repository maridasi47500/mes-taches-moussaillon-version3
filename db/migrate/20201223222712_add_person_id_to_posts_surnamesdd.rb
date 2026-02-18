class AddPersonIdToPostsSurnamesdd < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :posts_surname_id, :integer
  end
end
