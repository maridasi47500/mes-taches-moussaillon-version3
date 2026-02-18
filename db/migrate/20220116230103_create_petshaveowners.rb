class CreatePetshaveowners < ActiveRecord::Migration[6.0]
  def change
    create_table :petshaveowners do |t|
      t.integer :person_id
      t.integer :pet_id
    end
  end
end
