FactoryBot.define do
  factory :notification do
    user { nil }
    message { "MyText" }
    seen { false }
  end
end
