json.array!(@zones) do |zone|
  json.extract! zone, :id, :description
  json.url zone_url(zone, format: :json)
end