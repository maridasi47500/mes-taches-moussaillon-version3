class AddHitsToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :hits, :integer
  end
end
