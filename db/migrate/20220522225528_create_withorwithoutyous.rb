class CreateWithorwithoutyous < ActiveRecord::Migration[6.0]
  def change
    create_table :withorwithoutyous do |t|
t.timestamps
    end
    create_table :withyous do |t|
t.integer :withorwithoutyou_id
t.integer :person_id
    end
    create_table :withoutyous do |t|
t.integer :withorwithoutyou_id
t.integer :person_id
    end
  end
end
