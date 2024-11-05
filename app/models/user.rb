class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :completions, dependent: :destroy

  validates :email_address, uniqueness: true
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def completed?(object)
    completed_content?(object) || completed_quiz?(object)
  end

  def completed_content?(content)
    completions.exists?(content:)
  end

  def completed_quiz?(quiz)
    MultipleChoiceQuizAttempt.exists?(user: self, multiple_choice_quiz: quiz)
  end

  def top_score_on_quiz(quiz)
    total = quiz.multiple_choice_questions.count
    correct = MultipleChoiceQuizAttempt.where(user: self, multiple_choice_quiz: quiz).maximum(:score)
    "#{correct}/#{total}"
  end

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response["uid"], provider: response["provider"]) do |u|
      u.email_address = response["info"]["email"]
      u.username = response["info"]["name"]
      u.password = SecureRandom.hex(16)
    end
  end
end
