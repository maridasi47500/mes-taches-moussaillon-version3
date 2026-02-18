class AddRecordingfemmeIdToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :recordingfemme_id, :integer
    add_column :lessons, :recordinghomme_id, :integer
  end
end
