class AddPostsSurnameIdToJingles < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :posts_surname_id, :integer
  end
end
