class CreateTechniquestasks < ActiveRecord::Migration[6.0]
  def change
    create_table :techniquestasks do |t|
      t.integer :technique_id
      t.integer :task_id
    end
  end
end
