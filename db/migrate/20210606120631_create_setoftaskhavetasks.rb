class CreateSetoftaskhavetasks < ActiveRecord::Migration[6.0]
  def change
    create_table :setoftaskhavetasks do |t|
      t.integer :task_id
      t.integer :setoftask_id
    end
  end
end
