json.array!(@locals) do |local|
  json.extract! local, :id, :name, :category, :address, :city, :state, :cep, :cnpj, :company_name
  json.url local_url(local, format: :json)
end
