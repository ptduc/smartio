json.extract! message_log, :id, :content, :created_at, :updated_at
json.url message_log_url(message_log, format: :json)
