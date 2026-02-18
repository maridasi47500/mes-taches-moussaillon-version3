class CreateSynonyms < ActiveRecord::Migration[6.0]
  def change
    create_table :synonyms do |t|
      t.integer :synonym_id
      t.string :content

      t.timestamps
    end
  end
end
