class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name_en
      t.string :name_fr
      t.string :name_de
    end
  end
end
