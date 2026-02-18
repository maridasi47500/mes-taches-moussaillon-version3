class CreatePersonstate < ActiveRecord::Migration[6.0]
  def change
    create_table :remedieshavefoods do |t|
t.integer :food_id
t.integer :personstate_id
t.timestamps
    end
    create_table :remedieshavedrinks do |t|
t.integer :drink_id
t.integer :personstate_id
t.timestamps
    end
    
    create_table :personstates do |t|
t.string :state_fr
t.string :state_en
t.string :state_de
t.timestamps
    end
  end
end
