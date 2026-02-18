class CreatePeopleSurnames < ActiveRecord::Migration[6.0]
  def change
    create_table :people_surnames do |t|
      t.integer :person_id
      t.integer :surname_id
    end
  end
end
