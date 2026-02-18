class RenameColumntable < ActiveRecord::Migration[6.0]
  def change
    rename_table :threads, :poststhreads
    rename_column :threadhavemanyposts, :thread_id, :poststhread_id

  end
end
