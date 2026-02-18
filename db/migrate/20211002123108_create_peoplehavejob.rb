class CreatePeoplehavejob < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplehavejobs do |t|
      t.integer :person_id
      t.integer :job_id
    end
  end
end
