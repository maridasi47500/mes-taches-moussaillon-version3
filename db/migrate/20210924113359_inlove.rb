class Inlove < ActiveRecord::Migration[6.0]
  def change
create_table :inloves do |t|
t.integer :person_id
t.integer :user_id
t.integer :otherperson_id
t.integer :intensity
  end
  end
end
