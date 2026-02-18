class CreateMysentences < ActiveRecord::Migration[6.0]
  def change
    create_table :mysentences do |t|
      t.string :content_fr
      t.string :content_en
      t.string :content_de
      t.integer :user_id
      t.timestamps
    end
    create_table :aboutsomethings do |t|
      t.integer :myid
      t.integer :mysentence_id
      t.integer :thing_id
      t.string :name_fr
      t.string :name_en
      t.string :name_de
      t.text :content_fr
      t.text :content_en
      t.text :content_de
      t.string :image
      t.integer :user_id
      t.timestamps
    end
    create_table :aboutsomeones do |t|
      t.integer :myid
      t.integer :mysentence_id
      t.integer :person_id
      t.string :name_fr
      t.string :name_en
      t.string :name_de
      t.text :content_fr
      t.text :content_en
      t.text :content_de
      t.string :image
      t.integer :user_id
      t.timestamps
    end
  end
end
