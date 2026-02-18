class CreateSportGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :sport_groups do |t|
      t.string :name_en
      t.string :name_fr
      t.string :name_de
      t.string :code
    end
  end
end
