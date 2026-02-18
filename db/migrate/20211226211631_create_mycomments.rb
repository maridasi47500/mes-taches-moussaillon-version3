class CreateMycomments < ActiveRecord::Migration[6.0]
  def change
    create_table :mycomments do |t|
      t.integer :user_id
      t.text :content_fr
      t.text :content_en
      t.text :content_de
    end
  end
end
