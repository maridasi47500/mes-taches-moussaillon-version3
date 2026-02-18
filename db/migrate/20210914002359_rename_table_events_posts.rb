class RenameTableEventsPosts < ActiveRecord::Migration[6.0]
  def change
rename_table :events_posts, :posts_tasks
  end
end
