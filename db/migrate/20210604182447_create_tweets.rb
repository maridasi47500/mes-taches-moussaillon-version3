class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :content
      t.string :username
      t.string :lieu

      t.timestamps
    end
  end
end
