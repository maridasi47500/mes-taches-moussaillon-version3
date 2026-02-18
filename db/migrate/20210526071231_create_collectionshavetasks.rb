class CreateCollectionshavetasks < ActiveRecord::Migration[6.0]
  def change
    create_table :collectionshavetasks do |t|
      t.integer :collection_id
      t.integer :task_id
    end
  end
end
