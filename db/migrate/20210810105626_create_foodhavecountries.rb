class CreateFoodhavecountries < ActiveRecord::Migration[6.0]
  def change
    create_table :foodhavecountries do |t|
      t.integer :dish_id
      t.integer :country_id
    end
  end
end
