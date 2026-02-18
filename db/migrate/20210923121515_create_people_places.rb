class CreatePeoplePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :people_places do |t|
      t.integer :person_id
      t.integer :place_id
    end
  end
end
