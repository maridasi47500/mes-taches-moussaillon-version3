class CreateTaskhasgithubaccount < ActiveRecord::Migration[6.0]
  def change
    create_table :githubrepos do |t|
      t.string :reponame
      t.integer :githubaccount_id
    end
    create_table :taskhasgithubrepos do |t|
      t.integer :githubrepo_id
      t.integer :task_id
    end
  end
end
