class CreatePermanentprofilepics < ActiveRecord::Migration[6.0]
  def change
    create_table :permanentprofilepics do |t|
      t.integer :person_id
      t.integer :profilepicture_id
    end
  end
end
