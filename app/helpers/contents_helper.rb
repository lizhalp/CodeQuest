module ContentsHelper
  def formated_content_types
    Content.types.map do |type|
      # Type is a string in pascal case
      # We want to convert it to a human readable format
      #
      # Example: ArticleWithQuiz => Article with quiz

      # Convert the string to an array of words
      words = type.scan(/[A-Z][a-z]+/)

      # Return the formatted string
      words.join(" ")
    end
  end
end
