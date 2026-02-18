class CreateEmailsEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :emails_events do |t|
      t.integer :email_id
      t.integer :event_id
      t.integer :task_id
    end
  end
end
