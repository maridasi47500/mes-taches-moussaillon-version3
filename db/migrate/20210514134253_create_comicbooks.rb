class CreateComicbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :comicbooks do |t|
      t.string :title
      t.text :description
      t.string :image
    end
  end
end
