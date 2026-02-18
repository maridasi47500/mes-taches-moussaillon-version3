class Renametables < ActiveRecord::Migration[6.0]
  def change
    rename_table :events_posts, :events_people
    rename_table :posts_tasks, :people_tasks
    change_column :people_tasks, :post_id, :person_id
    change_column :events_people, :post_id, :person_id
    
  end
end
