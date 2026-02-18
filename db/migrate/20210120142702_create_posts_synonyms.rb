class CreatePostsSynonyms < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_synonyms do |t|
      t.integer :post_id
      t.integer :synonym_id
    end
  end
end
