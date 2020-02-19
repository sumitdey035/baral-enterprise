json.extract! request, :id, :name, :mobile, :status, :date, :created_at, :updated_at
json.url request_url(request, format: :json)
