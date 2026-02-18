class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :name
    end
    add_column :people, :collection_id, :integer

  end
end
