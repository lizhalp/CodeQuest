FactoryBot.define do
  factory :lesson do
    course { create(:course) }
    user_id { create(:user).id }
    chapter { nil }
    body { "MyText" }
    title { "Sample Lesson" }

    after(:create) do |lesson|
      create_list(:tag, 3, taggable: lesson)
    end
  end
end
