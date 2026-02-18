class Whttwopeoplecando < ActiveRecord::Migration[6.0]
  def change
create_table :twopeople do |t|
t.integer :person_id
t.integer :otherperson_id
end
remove_column :linkspousepeople, :person_id
remove_column :linkspousepeople, :otherperson_id
add_column :linkspousepeople, :twoperson_id, :integer
remove_column :linkfamilypeople, :person_id
remove_column :linkfamilypeople, :otherperson_id
add_column :linkfamilypeople, :twoperson_id, :integer
remove_column :worktwos, :otherperson_id
remove_column :worktwos, :person_id
add_column :worktwos, :twoperson_id, :integer
  end
end
