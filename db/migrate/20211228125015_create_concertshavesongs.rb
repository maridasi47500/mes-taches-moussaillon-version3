class CreateConcertshavesongs < ActiveRecord::Migration[6.0]
  def change
    create_table :concertshavesongs do |t|
      t.integer :concert_id
      t.integer :song_id
    end
  end
end
