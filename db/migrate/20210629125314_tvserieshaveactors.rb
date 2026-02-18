class Tvserieshaveactors < ActiveRecord::Migration[6.0]
  def change
    create_table :tvserieshaveactors do |t|
      t.integer :person_id
      t.integer :tvseries_id
    end
  end
end
