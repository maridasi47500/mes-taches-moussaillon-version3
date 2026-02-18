class CreateTaskshaveaidememoires < ActiveRecord::Migration[6.0]
  def change
    create_table :taskshaveaidememoires do |t|
      t.integer :aidememoire_id
      t.integer :task_id
    end
  end
end
