require 'faker'

# Create users
10.times do
  User.find_or_create_by!(email_address: Faker::Internet.unique.email) do |user|
    user.password_digest = Faker::Internet.password(min_length: 8)
    user.username = Faker::Internet.unique.username
    user.image_url = Faker::Avatar.image
  end
end

# Create courses
10.times do
  Course.find_or_create_by!(title: Faker::Educator.course_name) do |course|
    course.description = Faker::Lorem.paragraph
    course.user_id = User.pluck(:id).sample
    course.public = [ true, false ].sample
    course.has_chat = [ true, false ].sample
    course.image.attach io: File.open(Rails.root.join("app/assets/images/courses/1.png")), filename: "course.png"
  end
end

# Create chapters
Course.all.each do |course|
  (3..25).to_a.sample.times do |i|
    Chapter.find_or_create_by!(course_id: course.id, number: i + 1) do |chapter|
      chapter.title = Faker::Book.title
      chapter.user_id = course.user_id
    end
  end
end

# Create lessons
Chapter.all.each do |chapter|
  (2..7).to_a.sample.times do
    Lesson.create!(
      chapter_id: chapter.id,
      course_id: chapter.course_id,
      title: Faker::Lorem.paragraph,
      body: Faker::Lorem.paragraphs(number: 30).join("\n\n"),
      user_id: chapter.user_id
    )
  end
end

# Create tags for lessons and courses
Lesson.all.each do |lesson|
  (1..5).to_a.sample.times do
    lesson.tags.find_or_create_by!(name: Faker::Educator.subject) do |tag|
      tag.taggable = lesson
    end
  end
end

Course.all.each do |course|
  (1..5).to_a.sample.times do
    course.tags.find_or_create_by!(name: Faker::Educator.subject) do |tag|
      tag.taggable = course
    end
  end
end
