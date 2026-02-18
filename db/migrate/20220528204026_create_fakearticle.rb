class CreateFakearticle < ActiveRecord::Migration[6.0]
  def change
    create_table :fakearticles do |t|
      t.string :title
      t.string :authorpseudo
      t.string :authorname
      t.text :content
      t.string :category
      t.string :pic
      t.string :authorpic
t.timestamps
    end
  end
end
