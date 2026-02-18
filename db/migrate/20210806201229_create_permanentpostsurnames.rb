class CreatePermanentpostsurnames < ActiveRecord::Migration[6.0]
  def change
    create_table :permanentpostsurnames do |t|
      t.integer :person_id
      t.integer :posts_surname_id
    end
  end
end
