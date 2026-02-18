class CreatePeoplehaveetnicities < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplehaveetnicities do |t|
      t.integer :person_id
      t.integer :etnicity_id
    end
    create_table :peoplehavereligions do |t|
      t.integer :person_id
      t.integer :religion_id
    end
  end
end
