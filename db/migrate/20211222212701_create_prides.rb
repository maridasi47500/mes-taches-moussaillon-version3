class CreatePrides < ActiveRecord::Migration[6.0]
  def change
    create_table :prejudices do |t|
      t.text :content_fr
      t.text :content_de
      t.text :content_en
      t.timestamps
    end
    create_table :prides do |t|
      t.text :content_fr
      t.text :content_de
      t.text :content_en
      t.timestamps
    end
  end
end
