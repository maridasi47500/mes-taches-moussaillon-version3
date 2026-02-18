class CreateInterested < ActiveRecord::Migration[6.0]
  def change
    create_table :interestedpeople do |t|
      t.boolean :interested
      t.integer :alias_id
      t.integer :person_id
      t.date :date
       t.timestamps
    end
  end
end
