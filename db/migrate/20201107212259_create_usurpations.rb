class CreateUsurpations < ActiveRecord::Migration[6.0]
  def change
    create_table :usurpations do |t|
      t.integer :author_id
      t.integer :person_id
      t.string :name
    end
  end
end
