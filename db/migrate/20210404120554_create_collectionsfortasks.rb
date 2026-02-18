class CreateCollectionsfortasks < ActiveRecord::Migration[6.0]
  def change
    create_table :collectionsfortasks do |t|
      t.integer :task_id
      t.integer :event_id
      t.integer :collection_id
    end
  end
end
