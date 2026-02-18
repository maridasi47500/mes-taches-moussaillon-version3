class CreateTickethavesailorjobs < ActiveRecord::Migration[6.0]
  def change
    create_table :tickethavesailorjobs do |t|
      t.integer :ticket_id
      t.integer :sailorjob_id
    end
  end
end
