class CreateAnaphorsPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :anaphors_photos do |t|
      t.integer :anaphor_id
      t.integer :photo_id
    end
  end
end
