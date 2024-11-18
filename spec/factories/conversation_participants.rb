FactoryBot.define do
  factory :conversation_participant do
    conversation { nil }
    user { nil }
    pinned { false }
    role { "MyString" }
    last_read_at { "2024-11-11 22:39:09" }
  end
end
