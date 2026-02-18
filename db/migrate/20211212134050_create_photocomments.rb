class CreatePhotocomments < ActiveRecord::Migration[6.0]
  def change
    create_table :photocomments do |t|
      t.integer :photo_id
      t.text :content_fr
      t.text :content_en
      t.text :content_de
      t.timestamps
    end
  end
end
