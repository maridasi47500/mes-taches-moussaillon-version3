json.extract! scheduledtask, :id, :date_and_time, :name, :person_id, :created_at, :updated_at
json.url scheduledtask_url(scheduledtask, format: :json)
