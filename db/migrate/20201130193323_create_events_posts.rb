class CreateEventsPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :events_posts do |t|
      t.integer :task_id
      t.integer :post_id
    end
  end
end
