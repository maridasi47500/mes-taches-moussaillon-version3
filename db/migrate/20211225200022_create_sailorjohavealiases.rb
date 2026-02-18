class CreateSailorjohavealiases < ActiveRecord::Migration[6.0]
  def change
    create_table :sailorjobhavealiases do |t|
      t.integer :user_id
      t.integer :sailorjob_id
    end
  end
end
