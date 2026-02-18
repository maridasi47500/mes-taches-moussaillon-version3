class CreatePersonhavelifestates < ActiveRecord::Migration[6.0]
  def change
    create_table :personhavelifestates do |t|
      t.integer :person_id
      t.integer :lifestate_id
    end
    create_table :personhavelifestateshavephotos do |t|
      t.integer :photo_id
      t.integer :personhavelifestate_id
    end
    create_table :lifestateshaverequests do |t|
      t.integer :requeststoperson_id
      t.integer :personhavelifestate_id
    end
  end
end
