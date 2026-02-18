class CreateGithubreposhaveplaces < ActiveRecord::Migration[6.0]
  def change
    create_table :githubreposhaveplaces do |t|
      t.integer :place_id
      t.integer :githubrepo_id
    end
  end
end
