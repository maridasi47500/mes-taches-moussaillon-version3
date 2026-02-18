class CreateTraumberufe < ActiveRecord::Migration[6.0]
  def change
    create_table :traumberufe do |t|
      t.integer :job_id
      t.integer :person_id
    end
  end
end
