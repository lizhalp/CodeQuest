Sidekiq.configure_server do |config|
    config.on(:startup) do
      Sidekiq.schedule = YAML.load_file(File.expand_path('../sidekiq_schedule.yml', __dir__))
      Sidekiq::Scheduler.reload_schedule!
    end
  end
  
  Sidekiq.configure_client do |config|
    # Configuration options for the Sidekiq client
    # config.redis = { url: "redis://localhost:6379/0" }
  end