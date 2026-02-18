class CreateAnaphorsPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :anaphors_people do |t|
      t.integer :anaphor_id
      t.integer :person_id
    end
  end
end
