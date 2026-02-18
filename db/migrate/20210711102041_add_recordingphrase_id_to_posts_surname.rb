class AddRecordingphraseIdToPostsSurname < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :recordingphrase_id, :integer
    add_column :posts_surnames, :recordingword_id, :integer
  end
end
