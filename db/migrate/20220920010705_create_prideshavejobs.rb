class CreatePrideshavejobs < ActiveRecord::Migration[6.0]
  def change
    create_table :prideshavejobs do |t|
      t.integer :pride_id
      t.integer :job_id
    end
  end
end
