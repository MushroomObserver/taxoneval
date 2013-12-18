json.array!(@reports) do |report|
  json.extract! report, :id, :taxon
  json.url report_url(report, format: :json)
end
