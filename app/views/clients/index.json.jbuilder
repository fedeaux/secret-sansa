json.array!(@clients) do |client|
  json.extract! client, :id, :name, :title, :observations
  json.url client_url(client, format: :json)
end
