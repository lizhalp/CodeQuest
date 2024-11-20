FactoryBot.define do
  factory :lesson do
    course { nil }
    user { nil }
    chapter { nil }
    body { "MyText" }
  end
end
