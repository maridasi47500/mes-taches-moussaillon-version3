class CreatePostsTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_tasks do |t|
      t.integer :post_id
      t.integer :task_id
    end
    create_table :events_tasks do |t|
      t.integer :event_id
      t.integer :task_id
    end
    create_table :events_posts do |t|
      t.integer :event_id
      t.integer :task_id
    end
    add_column :doubles, :double_id, :integer
  end
end
