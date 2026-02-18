class CreateProfilepictures < ActiveRecord::Migration[6.0]
  def change
    create_table :profilepictures do |t|
      t.string :name
      t.integer :person_id
    end
  end
end
