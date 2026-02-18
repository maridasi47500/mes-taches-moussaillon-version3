class CreateGoogleRequestsTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :google_requests_tasks do |t|
      t.integer :google_request_id
      t.integer :task_id
    end
  end
end
