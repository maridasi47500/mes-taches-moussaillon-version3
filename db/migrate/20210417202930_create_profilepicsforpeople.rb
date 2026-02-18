class CreateProfilepicsforpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :profilepicsforpeople do |t|
      t.integer :person_id
      t.integer :profilepicture_id
    end
  end
end
