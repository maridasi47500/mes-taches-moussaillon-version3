class CreateUserhavefamily < ActiveRecord::Migration[6.0]
  def change
    create_table :userhavefamilies do |t|
      t.integer :user_id
      t.integer :familylink_id
      t.integer :person_id
    end
   add_column :parentlinks, :image, :string
  end
end
