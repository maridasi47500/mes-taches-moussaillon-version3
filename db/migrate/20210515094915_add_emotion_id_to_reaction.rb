class AddEmotionIdToReaction < ActiveRecord::Migration[6.0]
  def change
    add_column :reactions, :emotion_id, :integer
  end
end
