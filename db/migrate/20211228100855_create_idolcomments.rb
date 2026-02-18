class CreateIdolcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :idolcomments do |t|
      t.integer :tvserieshaveactor_id
      t.integer :alias_id
      t.text :content_fr
      t.text :content_en
      t.text :content_de
    end
  end
end
