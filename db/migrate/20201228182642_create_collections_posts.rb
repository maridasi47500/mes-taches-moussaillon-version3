class CreateCollectionsPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :collections_posts do |t|
      t.integer :collection_id
      t.integer :post_id
    end
  end
end
