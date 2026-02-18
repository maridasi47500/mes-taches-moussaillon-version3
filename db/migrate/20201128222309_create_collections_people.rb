class CreateCollectionsPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :collections_people do |t|
      t.integer :collection_id
      t.integer :person_id
    end
  end
end
