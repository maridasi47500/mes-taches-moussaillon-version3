class CreateCoupleevents < ActiveRecord::Migration[6.0]
  def change
    create_table :coupleevents do |t|
      t.integer :linkspouseperson_id
      t.text :content_fr
      t.text :content_en
      t.date :date
      t.integer :user_id
      t.timestamps
    end
  end
end
