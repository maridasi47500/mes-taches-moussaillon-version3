class CreateForms < ActiveRecord::Migration[6.0]
  def change
    create_table :forms do |t|
t.timestamps
    end
    create_table :formshavewebpages do |t|
t.integer :webpage_id
t.integer :mymenu_id
    end
add_column :webpages, :image,:string
  end
end
