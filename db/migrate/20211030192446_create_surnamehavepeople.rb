class CreateSurnamehavepeople < ActiveRecord::Migration[6.0]
  def change
    create_table :surnamehavepeople do |t|
      t.integer :surname_id
      t.integer :person_id
    end
  end
end
