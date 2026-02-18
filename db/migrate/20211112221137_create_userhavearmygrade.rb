class CreateUserhavearmygrade < ActiveRecord::Migration[6.0]
  def change
    create_table :userhavearmygrades do |t|
     t.integer :user_id
     t.integer :armygrade_id
    end
    create_table :userhaveskills do |t|
     t.integer :user_id
     t.integer :skill_id
    end
    create_table :userhaveclothes do |t|
     t.integer :user_id
     t.integer :clothing_id
    end
    create_table :userhavesongs do |t|
     t.integer :user_id
     t.integer :song_id
    end
  end
end
