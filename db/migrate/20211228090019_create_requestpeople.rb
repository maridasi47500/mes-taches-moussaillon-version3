class CreateRequestpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :requestpeople do |t|
      t.integer :persona_id
      t.integer :personb_id
      t.timestamps
    end
    create_table :requeststopeople do |t|
      t.integer :requestperson_id
      t.integer :alias_id
      t.text :content_fr
      t.text :content_en
      t.text :content_de
      t.timestamps
    end
    
  end
end
