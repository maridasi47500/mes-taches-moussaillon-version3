class CreateMylinkedtasks < ActiveRecord::Migration[6.0]
  def change
    create_table :mylinkedtasks do |t|
      t.integer :task_id
      t.integer :linkedtask_id
    end
  end
end
