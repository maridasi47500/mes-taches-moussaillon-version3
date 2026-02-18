class CreatePeopleknowcomputingstuff < ActiveRecord::Migration[6.0]
  def change
    create_table :peopleknowcomputingstuffs do |t|
      t.integer :computingstuff_id
      t.integer :person_id
    end
  end
end
