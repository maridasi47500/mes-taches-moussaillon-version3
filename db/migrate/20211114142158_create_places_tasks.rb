class CreatePlacesTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :places_tasks do |t|
      t.integer :place_id
      t.integer :task_id
    end
  end
end
