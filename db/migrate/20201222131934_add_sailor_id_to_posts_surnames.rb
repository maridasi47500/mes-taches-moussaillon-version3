class AddSailorIdToPostsSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :sailor_id, :integer
  end
end
