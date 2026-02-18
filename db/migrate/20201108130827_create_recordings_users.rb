class CreateRecordingsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :recordings_users do |t|
      t.integer :recording_id
      t.integer :user_id
    end
  end
end
