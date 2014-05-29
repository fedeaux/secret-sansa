json.array!(@leads) do |lead|
  json.extract! lead, :id, :subject, :last_event_on, :status, :has_pendencies, :has_file_pendencies, :disabled
  json.url lead_url(lead, format: :json)
end
