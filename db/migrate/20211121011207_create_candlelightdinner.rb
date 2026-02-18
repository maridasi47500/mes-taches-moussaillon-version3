class CreateCandlelightdinner < ActiveRecord::Migration[6.0]
  def change
    create_table :candlelightdinners do |t|
      t.date :date
      t.integer :tomorrow_morning_task
      t.integer :person_id
      t.integer :otherperson_id
    end
  end
end
