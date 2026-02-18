class CreateMemepensees < ActiveRecord::Migration[6.0]
  def change
    create_table :memepensees do |t|
      t.integer :person_id
      t.integer :post_id
    end
    create_table :memes do |t|
      t.integer :person_id
      t.integer :post_id
    end

  end
end
