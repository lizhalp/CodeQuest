# frozen_string_literal: true

FactoryBot.define do
  factory :friend_request do
    sender_id { nil }
    recipient_id { nil }
    accepted { nil }

    # Creating a friend request as accepted makes sender and recipient
    # friends automatically.
    trait :accepted do
      accepted { true }
    end

    trait :rejected do
      accepted { false }
    end
  end
end
