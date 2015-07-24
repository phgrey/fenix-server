json.array!(@hosts) do |host|
  json.extract! host, :id, :hash
  json.url host_url(host, format: :json)
end
