class CreateChoicemenu < ActiveRecord::Migration[6.0]
  def change
    create_table :choicemenus do |t|
      t.text :content_fr
      t.text :content_en
      t.integer :mymenu_id
      t.integer :user_id
      t.integer :webpage_id
      t.timestamps
    end
  end
end
