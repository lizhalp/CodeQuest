# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "784907228108-9fjkejuvk0gt1h1n3h7m31hadgk27qti.apps.googleusercontent.com", "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"
  provider :discord, "1299767663060451398", "pXy-DN4a7xekJUyVa9HT1PbJD635mW3f", scope: "email identify"
end
OmniAuth.config.allowed_request_methods = %i[get]
