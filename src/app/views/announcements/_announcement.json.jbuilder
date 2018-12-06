json.extract! announcement, :id, :author, :text, :date, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
