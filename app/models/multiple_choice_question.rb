class MultipleChoiceQuestion < ApplicationRecord
  belongs_to :multiple_choice_quiz

  validate :options_are_csv
  validate :answer_is_option

  private
    def options_are_csv
      return unless options.present?

      options_array = options.split(",").map(&:strip)
      if options_array.size < 2
        errors.add(:options, "must have at least two, comma-separated options")
      end
    end

    def answer_is_option
      return unless answer.present?

      options_array = options.split(",").map(&:strip)
      unless options_array.include?(answer)
        errors.add(:answer, "must be one of the options")
      end
    end
end
