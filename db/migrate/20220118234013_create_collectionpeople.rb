class CreateCollectionpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :collectionpeople do |t|
      t.integer :collection_id
      t.integer :person_id
    end
  end
end
