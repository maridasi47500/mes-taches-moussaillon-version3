class CreateGithubreposhaveprogramminglanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :githubreposhaveprogramminglanguages do |t|
      t.integer :programminglanguage_id
      t.integer :githubrepo_id
    end
  end
end
