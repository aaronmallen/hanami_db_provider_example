Parent::Slice.slices[:child].configure_provider :db do
  config.gateway :default do |gw|
    gw.database_url = "postgres://#{ENV['DATABASE_PASSWORD']}:#{ENV['DATABASE_USER']}@localhost:5432/child"
  end
end
