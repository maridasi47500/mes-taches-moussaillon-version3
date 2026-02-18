class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :name_fr
      t.string :name_en
      t.string :name_de
      t.integer :city_id
	t.timestamps
    end
  end
end
