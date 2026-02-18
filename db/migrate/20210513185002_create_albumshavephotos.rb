class CreateAlbumshavephotos < ActiveRecord::Migration[6.0]
  def change
    create_table :albumshavephotos do |t|
      t.integer :album_id
      t.integer :photo_id
    end
  end
end
