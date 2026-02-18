class CreateInternetpseudonymshavecities < ActiveRecord::Migration[6.0]
  def change
    create_table :internetpseudonymshavecities do |t|
      t.integer :internetpseudonym_id
      t.integer :city_id
    end
  end
end
