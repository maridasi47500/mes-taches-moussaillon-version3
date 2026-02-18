class CreateInstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|
      t.string :content_fr
      t.string :content_en
      t.string :content_de
      t.integer :otherinstruction_id
    end
  end
end
