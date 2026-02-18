class Renamecoluerges < ActiveRecord::Migration[6.0]
  def change
    rename_column :events_posts, :task_id, :post_id
  end
end
