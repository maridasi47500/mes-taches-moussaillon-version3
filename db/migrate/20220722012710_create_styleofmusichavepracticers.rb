class CreateStyleofmusichavepracticers < ActiveRecord::Migration[6.0]
  def change
    create_table :styleofmusichavepracticers do |t|
      t.integer :styleofmusic_id
      t.integer :person_id
    end
    create_table :styleofmusichavelisteners do |t|
      t.integer :styleofmusic_id
      t.integer :person_id
    end
  end
end
