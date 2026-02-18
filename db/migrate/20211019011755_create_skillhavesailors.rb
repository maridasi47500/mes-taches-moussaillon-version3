class CreateSkillhavesailors < ActiveRecord::Migration[6.0]
  def change
    create_table :skillhavesailors do |t|
      t.integer :skill_id
      t.integer :person_id
    end
  end
end
