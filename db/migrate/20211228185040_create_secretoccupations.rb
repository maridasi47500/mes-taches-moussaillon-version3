class CreateSecretoccupations < ActiveRecord::Migration[6.0]
  def change
    create_table :secretoccupations do |t|
      t.text :content_fr
      t.text :content_en
      t.text :content_de
      t.integer :aboutsomeonegossip_id
      t.integer :alias_id
      t.timestamps
    end
    create_table :secretoccupationshaveplaces do |t|
      t.integer :secretoccupation_id
      t.integer :place_id
    end
    create_table :secretoccupationshavepeople do |t|
      t.integer :secretoccupation_id
      t.integer :person_id
    end
  end
end
