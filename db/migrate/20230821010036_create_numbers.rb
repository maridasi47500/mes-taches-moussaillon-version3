class CreateNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :numbers do |t|
      t.string :mytype
      t.string :myunit
      t.string :myvalue
      t.text :description

      t.timestamps
    end
  end
end
