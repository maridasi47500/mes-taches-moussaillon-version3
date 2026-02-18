class CreateTaskshavefilms < ActiveRecord::Migration[6.0]
  def change
    create_table :taskshavefilms do |t|
      t.integer :film_id
      t.integer :task_id
    end
  end
end
