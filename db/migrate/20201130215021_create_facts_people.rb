class CreateFactsPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :facts_people do |t|
      t.integer :fact_id
      t.integer :person_id
    end
  end
end
