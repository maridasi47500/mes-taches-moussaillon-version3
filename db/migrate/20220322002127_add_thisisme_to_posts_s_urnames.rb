class AddThisismeToPostsSUrnames < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :whoiam, :boolean
  end
end
