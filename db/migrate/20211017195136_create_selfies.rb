class CreateSelfies < ActiveRecord::Migration[6.0]
  def change
    create_table :selfies do |t|
      t.string :name
      t.string :title
    end
    create_table :selfiehavesailors do |t|
      t.integer :selfie_id
      t.integer :person_id
      t.integer :emotion_id
    end
    create_table :selfiehaveposts do |t|
      t.integer :post_id
      t.integer :selfie_id
    end
  end
end
