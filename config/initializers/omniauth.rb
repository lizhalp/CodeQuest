# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "784907228108-9fjkejuvk0gt1h1n3h7m31hadgk27qti.apps.googleusercontent.com", "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"
end
OmniAuth.config.allowed_request_methods = %i[get]
