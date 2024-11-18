FactoryBot.define do
  factory :friend_request do
    sender { nil }
    recipient { nil }
    accepted { false }
  end
end
