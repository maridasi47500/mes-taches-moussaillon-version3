class CreateWikipediaPages < ActiveRecord::Migration[6.0]
  def change
    create_table :wikipedia_pages do |t|
      t.string :title
      t.text :description
      t.integer :person_id
    end
  end
end
