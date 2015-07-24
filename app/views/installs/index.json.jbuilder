json.array!(@installs) do |install|
  json.extract! install, :id, :host_id, :package, :installed_at, :uninstalled_at
  json.url install_url(install, format: :json)
end
