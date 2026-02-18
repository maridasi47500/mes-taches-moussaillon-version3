class CreateGithubaccount < ActiveRecord::Migration[6.0]
  def change
    create_table :githubaccounts do |t|
      t.string :nameowner
      t.integer :owner_id
      t.string :username
    end
  end
end
