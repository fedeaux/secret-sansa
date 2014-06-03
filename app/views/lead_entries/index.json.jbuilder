json.array!(@lead_entries) do |lead_entry|
  json.extract! lead_entry, :id, :text, :date, :relation
  json.url lead_entry_url(lead_entry, format: :json)
end
