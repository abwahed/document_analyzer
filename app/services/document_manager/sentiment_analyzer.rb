# frozen_string_literal: true

module DocumentManager
  class SentimentAnalyzer < ApplicationService
    def initialize(content)
      @content = content
    end

    def call
      positive_words = %w{good great excellent awesome nice best}
      negative_words = %w{bad terrible awful horrible worst disaster}
      words = @content.downcase.scan(/\w+/)
      positive_count = words.count { |word| positive_words.include?(word) }
      negative_count = words.count { |word| negative_words.include?(word) }

      if positive_count > negative_count
        :positive
      elsif positive_count < negative_count
        :negative
      else
        :neutral
      end
    end
  end
end
