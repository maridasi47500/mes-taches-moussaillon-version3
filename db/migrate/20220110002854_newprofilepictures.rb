class Newprofilepictures < ActiveRecord::Migration[6.0]
  def change
create_table :newprofilepictures do |t|
t.integer :person_id
t.integer :profilepicture_id
t.timestamps
end
  end
end
