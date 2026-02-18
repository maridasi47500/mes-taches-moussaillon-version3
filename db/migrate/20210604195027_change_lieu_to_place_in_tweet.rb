class ChangeLieuToPlaceInTweet < ActiveRecord::Migration[6.0]
  def change
    rename_column :tweets, :lieu, :place
  end
end
