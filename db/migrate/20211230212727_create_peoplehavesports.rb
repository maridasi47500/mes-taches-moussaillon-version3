class CreatePeoplehavesports < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplehavesports do |t|
      t.integer :person_id
      t.integer :sport_id
    end
  end
end
