# frozen_string_literal: true

module DocumentManager
  class KeywordAnalyzer < ApplicationService
    def initialize(content)
      @content = content
    end

    def call
      # excluding articles, verbs, prepositions from top keywords
      excluded_words = %w{a an the and but or of in on at by for with to from as is can will be shall are}
      words = @content.downcase.scan(/\w+/)
      frequency = Hash.new(0)
      words.each { |word| frequency[word] += 1 }
      frequency.reject! { |word, _| excluded_words.include?(word) }
      frequency.sort_by { |word, freq| -freq }.first(Document::TOP_KEYWORDS)
    end
  end
end
