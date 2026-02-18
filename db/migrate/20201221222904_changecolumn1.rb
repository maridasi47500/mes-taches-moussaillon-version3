class Changecolumn1 < ActiveRecord::Migration[6.0]
  def change
    rename_column :main_threads_posts, :main_thread, :main_thread_id
  end
end
