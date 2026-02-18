class AddTextedusynonymeToSynonyms < ActiveRecord::Migration[6.0]
  def change
    add_column :synonyms, :textedusynonyme, :string
  end
end
