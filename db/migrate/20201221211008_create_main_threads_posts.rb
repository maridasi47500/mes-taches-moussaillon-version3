class CreateMainThreadsPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :main_threads_posts do |t|
      t.integer :post_id
      t.integer :main_thread
      t.integer :task_id
      t.integer :event
    end
  end
end
