class CreateCles < ActiveRecord::Migration[6.0]
  def change
    create_table :cles do |t|
      t.date :date
      t.time :perception
      t.time :reintegration
      t.integer :armygrade_id
      t.integer :person_id
      t.string :observation
    end
  end
end
