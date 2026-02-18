class CreateSavedpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :savedpeople do |t|
      t.integer :person_id
      t.integer :user_id
    end
  end
end
