class CreateLotsofsurnames < ActiveRecord::Migration[6.0]
  def change
    create_table :lotsofsurnames do |t|
      t.integer :surname_id
      t.integer :posts_surname_id
    end
  end
end
