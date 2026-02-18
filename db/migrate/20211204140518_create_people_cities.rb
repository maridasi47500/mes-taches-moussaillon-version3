class CreatePeopleCities < ActiveRecord::Migration[6.0]
  def change
    create_table :people_cities do |t|
      t.integer :person_id
      t.integer :city_id
    end
  end
end
