class AddSavedtodbToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :savedtodb, :datetime
  end
end
