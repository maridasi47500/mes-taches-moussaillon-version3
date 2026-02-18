class CreateTwittercouples < ActiveRecord::Migration[6.0]
  def change
    create_table :twittercouples do |t|
      t.integer :twitteraccount_id
      t.integer :othertwitteraccount_id
    end
  end
end
