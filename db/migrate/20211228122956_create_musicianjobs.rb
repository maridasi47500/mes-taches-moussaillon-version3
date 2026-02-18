class CreateMusicianjobs < ActiveRecord::Migration[6.0]
  def change
    create_table :musicianjobs do |t|
      t.integer :musician_id
      t.integer :concert_id
    end
    create_table :musicalcompositionsjobs do |t|
      t.integer :musicalcomposition_id
      t.integer :concert_id
    end
  end
end
