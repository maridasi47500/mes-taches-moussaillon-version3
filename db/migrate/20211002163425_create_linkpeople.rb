class CreateLinkpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :linkfamilypeople do |t|
      t.integer :person_id
      t.integer :otherperson_id
      t.integer :familylink_id
    end
    create_table :linkspousepeople do |t|
      t.integer :person_id
      t.integer :otherperson_id
      t.integer :spouselink_id
    end
    create_table :parentlinks do |t|
t.string :type
      t.string :name_en
      t.string :name_fr
      t.string :name_de
    end
  end
end
