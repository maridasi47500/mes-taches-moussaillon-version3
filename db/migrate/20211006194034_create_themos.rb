class CreateThemos < ActiveRecord::Migration[6.0]
  def change
    create_table :betterpeople do |t|

t.integer :twoperson_id
t.integer :attitude_id
t.integer :user_id
    end
create_table :findthemost do |t|
t.integer :betterperson_id
t.integer :themost
t.integer :user_id
  end
  end
end
