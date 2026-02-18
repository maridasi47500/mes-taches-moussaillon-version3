
class CreateRecordingsTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :recordings_tasks do |t|
      t.integer :recording_id
      t.integer :task_id
    end
  end
end
