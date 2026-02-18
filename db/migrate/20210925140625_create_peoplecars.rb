class CreatePeoplecars < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplecars do |t|
      t.integer :person_id
      t.integer :car_id
      t.integer :user_id
    end
  end
end
