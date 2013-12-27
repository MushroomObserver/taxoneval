json.array!(@reports) do |report|
  json.extract! report, :id, :name
  json.url report_url(report, format: :json)
end
