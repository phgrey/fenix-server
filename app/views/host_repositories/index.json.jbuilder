json.array!(@host_repositories) do |host_repository|
  json.extract! host_repository, :id, :host_id, :repository_id, :active
  json.url host_repository_url(host_repository, format: :json)
end
