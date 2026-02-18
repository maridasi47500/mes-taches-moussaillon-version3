class CreatePhotosWikipediaPages < ActiveRecord::Migration[6.0]
  def change
    create_table :photos_wikipedia_pages do |t|
      t.integer :photo_id
      t.integer :wikipedia_page_id
    end
  end
end
