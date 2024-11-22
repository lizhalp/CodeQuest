# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    sequence(:title) { |n| "Course#{n}" }
    description { "MyText" }
    user_id { create(:user).id }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'assets', 'test.jpeg'), 'image/jpeg') }

    trait :public do
      public { true }
    end

    after :create do |course|
      create_list :chapter, 5, course: course
    end
  end
end
