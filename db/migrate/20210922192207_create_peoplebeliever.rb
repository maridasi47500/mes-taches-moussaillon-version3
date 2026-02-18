class CreatePeoplebeliever < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplebelievers do |t|
      t.integer :person_id
      t.integer :user_id
    end
  end
end
