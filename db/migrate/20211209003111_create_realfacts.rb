class CreateRealfacts < ActiveRecord::Migration[6.0]
  def change
    create_table :realfacts do |t|
      t.text :content_fr
      t.text :content_de
      t.text :content_en
      t.timestamps
    end
  end
end
