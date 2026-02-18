class AddActionNameToPostsSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :action_name, :string
  end
end
