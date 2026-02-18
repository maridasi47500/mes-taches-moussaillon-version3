class CreateHeroattitude < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplehaveweaknesses do |t|
      t.integer :linkspouseperson_id
      t.integer :person_id
      t.integer :weakness_id
      t.integer :user_id
    end
    create_table :peoplehavestrengths do |t|
      t.integer :linkspouseperson_id
      t.integer :person_id
      t.integer :strength_id
      t.integer :user_id
    end
    create_table :heroattitudes do |t|
      t.string :type
      t.string :name_fr
      t.string :name_en
      t.string :name_de
      t.timestamps
    end
    
  end
end
