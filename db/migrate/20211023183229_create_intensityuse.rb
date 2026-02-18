class CreateIntensityuse < ActiveRecord::Migration[6.0]
  def change
    create_table :taskusedstuffs do |t|
      t.integer :thing_id
      t.integer :task_id
      t.integer :user_id
      t.integer :use
      t.integer :nb
      
    end
    create_table :jobusedstuffs do |t|
      t.integer :thing_id
      t.integer :job_id
      t.integer :user_id
      t.integer :use
      t.integer :nb
      
    end
  end
end
