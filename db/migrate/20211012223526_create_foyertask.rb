class CreateFoyertask < ActiveRecord::Migration[6.0]
  def change
    create_table :foyertasks do |t|
      t.integer :user1
      t.integer :user2
      t.string :task
      t.timestamps
    end
  end
end
