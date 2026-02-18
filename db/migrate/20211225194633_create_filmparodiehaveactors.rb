class CreateFilmparodiehaveactors < ActiveRecord::Migration[6.0]
  def change
    create_table :filmparodiehaveactors do |t|
      t.integer :person_id
      t.integer :surname_id
      t.integer :film_id
    end
    create_table :tvseriesparodiehaveactors do |t|
      t.integer :person_id
      t.integer :surname_id
      t.integer :film_id
    end
  end
end
