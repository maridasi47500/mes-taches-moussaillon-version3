class CreateTwitteraccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :twitteraccounts do |t|
      t.string :name
      t.string :username

      t.timestamps
    end
  end
end
