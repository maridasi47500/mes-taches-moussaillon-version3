class CreateRivals < ActiveRecord::Migration[6.0]
  def change
    create_table :rivals do |t|
      t.integer :reallover_id
      t.integer :fakelover_id
    end
    create_table :rivalrypeople do |t|
      t.integer :rival_id
      t.integer :person_id
    end
  end
end
