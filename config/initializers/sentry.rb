# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = "https://1a4ee395fe40d6816ec1eab4d41e0906@o4508189750132736.ingest.us.sentry.io/4508351188631552"
  config.breadcrumbs_logger = [ :active_support_logger, :http_logger ]
  config.enable_tracing = true
end
