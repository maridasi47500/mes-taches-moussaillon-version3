class CreatePhotohavesailors < ActiveRecord::Migration[6.0]
  def change
    create_table :photohavesailors do |t|
      t.integer :person_id
      t.integer :photo_id
      t.integer :emotion_id
    end
  end
end
