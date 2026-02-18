class Peoplerecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplerecordings do |t|
      t.integer :person_id
      t.integer :recording_id
    end
    create_table :peoplesentences do |t|
      t.integer :person_id
      t.integer :recording_id
    end
  end
end
