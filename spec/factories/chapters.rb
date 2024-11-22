FactoryBot.define do
  factory :chapter do
    course { nil }
    user { create(:user) }
    title { "MyString" }
    number { 1 }
  end
end
