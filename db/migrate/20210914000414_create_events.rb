class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :city_id
      t.integer :country_id
      t.integer :state_id
      t.integer :longitude
      t.integer :latitude
      t.datetime :start_at
      t.datetime :end_at
    end
  end
end
