class CreateAliases < ActiveRecord::Migration[6.0]
  def change
    create_table :aliases do |t|
      t.integer :user_id
      t.integer :person_id
    end
  end
end
