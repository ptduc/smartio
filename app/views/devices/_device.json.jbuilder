json.extract! device, :id, :code, :unit_id, :is_active, :created_at, :updated_at
json.url device_url(device, format: :json)
