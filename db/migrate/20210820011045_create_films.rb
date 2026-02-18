class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :title
      t.string :image
      t.string :description
    end
    create_table :phavefilms do |t|
      t.integer :person_id
      t.integer :film_id
    end
  end
end
