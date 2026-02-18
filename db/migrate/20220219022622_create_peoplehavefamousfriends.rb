class CreatePeoplehavefamousfriends < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplehavefamousfriends do |t|
      t.integer :person_id
      t.integer :friend_id
    end
  end
end
