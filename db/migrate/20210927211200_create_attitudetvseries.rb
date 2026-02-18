class CreateAttitudetvseries < ActiveRecord::Migration[6.0]
  def change
    create_table :attitudetvseries do |t|
      t.integer :attitude_id
      t.integer :person_id
      t.integer :tvseries_id
      t.integer :note
      t.integer :user_id
    end
    create_table :attitudefilms do |t|
      t.integer :attitude_id
      t.integer :person_id
      t.integer :film_id
      t.integer :note
      t.integer :user_id
    end
  end
end
