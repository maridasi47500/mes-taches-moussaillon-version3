class CreateEpoch < ActiveRecord::Migration[6.0]
  def change
    create_table :epoches do |t|
      t.string :end_at
      t.string :start_at
      t.string :longitude
      t.string :latitude
      t.string :city_id
      t.string :plce_id
      t.string :state_id
      t.string :address
      t.string :name
      t.string :created_at
      t.string :updated_at
      t.string :type
      t.string :zoom
      t.string :image
      t.string :description
      t.string :event_type_id
      t.string :done
      t.string :idoit
      t.string :country_id
      t.string :nbtimes
    end
  end
end
