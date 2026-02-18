class CreatePeopleReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :people_reactions do |t|
      t.integer :person_id
      t.integer :reaction_id
    end
  end
end
