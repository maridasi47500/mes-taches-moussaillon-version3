class CreateLoverrelations < ActiveRecord::Migration[6.0]
  def change
    create_table :loverrelations do |t|
      t.integer :peoplerelation_id
      t.integer :linkspouseperson_id
      t.integer :user_id
    end
  end
end
