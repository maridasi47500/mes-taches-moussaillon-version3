class CreateFindthebest < ActiveRecord::Migration[6.0]
  def change
    create_table :findthebests do |t|
      t.integer :olympicperson_id
      t.integer :user_id
      t.integer :winner
    end
  end
end
