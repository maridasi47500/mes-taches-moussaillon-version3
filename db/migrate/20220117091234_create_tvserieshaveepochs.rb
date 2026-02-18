class CreateTvserieshaveepochs < ActiveRecord::Migration[6.0]
  def change
    create_table :tvserieshaveepochs do |t|
      t.integer :tvseries_id
      t.integer :epoch_id
    end
    create_table :filmhaveepochs do |t|
      t.integer :film_id
      t.integer :epoch_id
    end
  end
end
