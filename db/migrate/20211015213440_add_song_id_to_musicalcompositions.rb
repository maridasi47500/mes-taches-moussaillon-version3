class AddSongIdToMusicalcompositions < ActiveRecord::Migration[6.0]
  def change
    create_table :musicalcompositionshavesongs do |t|
     t.integer :song_id
     t.integer :musicalcomposition_id
    end
  end
end
