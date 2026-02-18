class CreateLangueRecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :langue_recordings do |t|
      t.integer :language_id
      t.integer :recording_id
      t.integer :emotion_id
    end
  end
end
