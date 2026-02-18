class CreateEventsMainThreads < ActiveRecord::Migration[6.0]
  def change
    create_table :events_main_threads do |t|
      t.integer :main_thread_id
      t.integer :event_id
    end
  end
end
