class CreateSelfportrait < ActiveRecord::Migration[6.0]
  def change
    create_table :selfportraits do |t|
      t.integer :sailor_id
      t.integer :bodydescription_id
      t.integer :faceshape_id
      t.integer :haircolor_id
      t.integer :hairtype_id
      t.integer :hairlength_id
      t.string :particularite
      t.integer :skin_color_id
      t.integer :skin_type_id
      t.integer :eyecolor_id
      t.boolean :smoke
      t.integer :taillecm
      t.integer :poidskg
      t.string :clothesstyle
      t.integer :clothescolor_id
      t.string :shoessize
      t.integer :biceps
      t.boolean :tattoo
      t.timestamps
    end
  end
end
