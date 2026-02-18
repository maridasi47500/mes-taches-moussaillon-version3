class CreatePersonhassosies < ActiveRecord::Migration[6.0]
  def change
    create_table :personhassosies do |t|
      t.integer :person_id
      t.integer :sosie_id
    end
  end
end
