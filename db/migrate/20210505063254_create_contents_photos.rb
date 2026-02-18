class CreateContentsPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :contents_photos do |t|
      t.integer :content_id
      t.integer :photo_id
    end
  end
end
