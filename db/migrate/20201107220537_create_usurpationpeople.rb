class CreateUsurpationpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :usurpationpeople do |t|
      t.integer :usurpation_id
      t.integer :person_id
    end
    create_table :usurpationrelatedpeople do |t|
      t.integer :usurpation_id
      t.integer :person_id
    end
  end
end
