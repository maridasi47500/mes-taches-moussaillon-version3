class AddFakenameToPostsSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :fakename, :boolean
  end
end
