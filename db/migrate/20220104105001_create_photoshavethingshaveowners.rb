class CreatePhotoshavethingshaveowners < ActiveRecord::Migration[6.0]
  def change
    create_table :photoshavethingshaveowners do |t|
      t.integer :photoshavething_id
      t.integer :person_id
      t.integer :user_id
    end
  end
end
