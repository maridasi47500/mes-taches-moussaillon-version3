class CreatePeoplecitieshavephotos < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplecitieshavephotos do |t|
      t.integer :people_city_id
      t.integer :photo_id
    end
  end
end
