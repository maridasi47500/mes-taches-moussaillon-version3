class CreateTvserieshaveplaces < ActiveRecord::Migration[6.0]
  def change
    create_table :tvserieshaveplaces do |t|
      t.integer :tvseries_id
      t.integer :place_id
    end
    create_table :tvseriesparodieshaveplaces do |t|
      t.integer :tvseriesparody_id
      t.integer :place_id
    end
    create_table :filmshaveplaces do |t|
      t.integer :film_id
      t.integer :place_id
    end
    create_table :filmsparodieshaveplaces do |t|
      t.integer :filmparody_id
      t.integer :place_id
    end
  end
end
