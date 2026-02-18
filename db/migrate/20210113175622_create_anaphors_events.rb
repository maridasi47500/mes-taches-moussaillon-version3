class CreateAnaphorsEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :anaphors_events do |t|
      t.integer :anaphor_id
      t.integer :event_id
      t.integer :task_id
    end
  end
end
