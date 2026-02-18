class CreateDrinkremedieshavepeople < ActiveRecord::Migration[6.0]
  def change
    create_table :drinkremedieshavepeople do |t|
      t.integer :remedieshavedrink_id
      t.integer :person_id
      t.timestamps
    end
    create_table :foodremedieshavepeople do |t|
      t.integer :remedieshavefood_id
      t.integer :person_id
      t.timestamps
    end
  end
end
