class CreateTaskshavesongs < ActiveRecord::Migration[6.0]
  def change
    create_table :taskshavesongs do |t|
      t.integer :task_id
      t.integer :song_id
    end
  end
end
