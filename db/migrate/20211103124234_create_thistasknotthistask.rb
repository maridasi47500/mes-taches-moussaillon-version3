class CreateThistasknotthistask < ActiveRecord::Migration[6.0]
  def change
    create_table :twopeoplemeets do |t|
      t.integer :person_id
      t.integer :otherperson_id
    end
    create_table :thistasknotthistasks do |t|
      t.integer :task_id
      t.integer :othertask_id
    end
  end
end
