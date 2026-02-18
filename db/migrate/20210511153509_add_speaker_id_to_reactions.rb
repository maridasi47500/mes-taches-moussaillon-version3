class AddSpeakerIdToReactions < ActiveRecord::Migration[6.0]
  def change
    add_column :reactions, :speaker_id, :integer
  end
end
