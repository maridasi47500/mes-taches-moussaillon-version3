class AddPostsSurnameIdToReactions < ActiveRecord::Migration[6.0]
  def change
    add_column :reactions, :posts_surname_id, :integer
  end
end
