class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.datetime :end_at
      t.datetime :start_at
      t.string :longitude
      t.string :latitude
      t.integer :city_id
      t.integer :place_id
      t.integer :state_id
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
