json.extract! lesson, :id, :title, :description, :user_id, :image, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
