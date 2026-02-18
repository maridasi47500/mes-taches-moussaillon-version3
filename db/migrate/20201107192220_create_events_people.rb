class CreateEventsPeople < ActiveRecord::Migration[6.0]
  def change
    rename_column :people_tasks, :post_id, :person_id
    rename_column :events_people, :post_id, :person_id
  end
end
