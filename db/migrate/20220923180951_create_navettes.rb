class CreateNavettes < ActiveRecord::Migration[6.0]
  def change
    create_table :navettes do |t|
      
      t.integer :citya_id
      t.integer :cityb_id
      t.date :go
      t.date :back
    end
    create_table :personarmycompagnies do |t|
	t.integer :person_id
	t.integer :armycompagny_id
	t.timestamps
    end
    create_table :navettepersonarmycompagnies do |t|
	t.integer :navette_id
	t.integer :personarmycompagny_id
	t.timestamps
    end
    create_table :armycompagnies do |t|
	t.string :name
	t.timestamps
    end
  end
end
