class CreateSchoolhpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :schoolhpeople do |t|
      t.integer :school_id
      t.integer :person_id
    end
  end
end
