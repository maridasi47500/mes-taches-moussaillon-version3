class CreateCompohaverecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :compohaverecipients do |t|
      t.integer :person_id
      t.integer :musicalcomposition_id
      t.integer :surname_id
    end
  end
end
