class CreateArtistshavewannabes < ActiveRecord::Migration[6.0]
  def change
    create_table :artistshavewannabes do |t|
      t.integer :artist_id
      t.integer :person_id
    end
  end
end
