class CreatePeoplehavelanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplehavelanguages do |t|
      t.integer :person_id
      t.integer :language_id
    end
  end
end
