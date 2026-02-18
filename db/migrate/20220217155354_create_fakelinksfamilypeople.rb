class CreateFakelinksfamilypeople < ActiveRecord::Migration[6.0]
  def change
    create_table :fakelinksfamilypeople do |t|
      t.integer :twoperson_id
      t.integer :familylink_id
      t.integer :user_id
    end
  end
end
