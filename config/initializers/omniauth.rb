# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "542105713608-os98o8uhedul4vjhtl7ocuhv48p82d9t.apps.googleusercontent.com", "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"
end
OmniAuth.config.allowed_request_methods = %i[get]
