class CreateNationality < ActiveRecord::Migration[6.0]
  def change
    create_table :nationalities do |t|
      t.string :name_en
      t.string :name_fr
      t.string :name_de
    end
rename_column :people, :nationality, :nationality_id
change_column :people, :nationality_id, :integer
  end
end
