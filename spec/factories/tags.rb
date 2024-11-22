FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| "Tag #{n}"  }
    taggable { nil }
  end
end
