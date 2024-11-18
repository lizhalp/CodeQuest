FactoryBot.define do
  factory :message do
    conversation { nil }
    user { nil }
    body { "MyText" }
  end
end
