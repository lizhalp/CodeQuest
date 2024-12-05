# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email_address) { |n| "user#{n}@example.com" }
    password { "password" }
    sequence(:username) { |n| "user#{n}" }
    image_url { "https://www.gravatar.com/avatar/00000000000000000000000000000000" }
  end
end
