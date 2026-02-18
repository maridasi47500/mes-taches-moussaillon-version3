class CreateNewspaperwriter < ActiveRecord::Migration[6.0]
  def change
    create_table :newspaperwriters do |t|
      t.integer :person_id
      t.integer :newspaper_id
    end
  end
end
