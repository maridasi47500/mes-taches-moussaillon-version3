class Musicianpeople < ActiveRecord::Migration[6.0]
  def change
create_table :artistpeople do |t|
t.integer :person_id
t.integer :artobject_id
t.integer :user_id
t.integer :practice
t.timestamps
end
create_table :schools do |t|
t.string :name 

t.string :image
t.timestamps
end
create_table :peopleschools do |t|
t.integer :person_id
t.integer :school_id
t.timestamps
end
  end
end
