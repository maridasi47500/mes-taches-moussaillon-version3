class CreateArmygrades < ActiveRecord::Migration[6.0]
  def change
    create_table :armygrades do |t|
      t.string :nom
      t.string :appellation
      t.string :image
      t.string :femme
    end
  end
end
