class CreateThisisjingles < ActiveRecord::Migration[6.0]
  def change
    create_table :thisisjingles do |t|
      t.integer :jingle_id
      t.integer :person_id
      t.integer :user_id
    end
  end
end
