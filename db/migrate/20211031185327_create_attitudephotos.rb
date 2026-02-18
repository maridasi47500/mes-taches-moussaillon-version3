class CreateAttitudephotos < ActiveRecord::Migration[6.0]
  def change
    create_table :attitudephotos do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :title_fr
      t.string :title_en
      t.string :title_de
      t.timestamps
    end
    create_table :traits do |t|
      t.string :name_fr
      t.string :name_en
      t.string :name_de
      t.timestamps
    end
    create_table :photopeoplehaveattitudes do |t|
      t.integer :attitudephoto_id
      t.integer :attitude_id
      t.integer :person_id
      t.timestamps
    end
    create_table :photopeoplehavetraits do |t|
      t.integer :attitudephoto_id
      t.integer :trait_id
      t.integer :person_id
      t.timestamps
    end
  end
  
end
