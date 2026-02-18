class CreateSongshavepeople < ActiveRecord::Migration[6.0]
  def change
    create_table :songshavepeople do |t|
      t.integer :song_id
      t.integer :person_id
    end
    create_table :songshaveradios do |t|
      t.integer :song_id
      t.integer :radio_id
    end
    create_table :songshavehotels do |t|
      t.integer :song_id
      t.integer :hotel_id
    end
  end
end
