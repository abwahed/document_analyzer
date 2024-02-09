# frozen_string_literal: true

module KeywordManager
  class KeywordCreator < ApplicationService
    def initialize(document, keywords)
      @document = document
      @keywords = keywords
    end

    def call
      @keywords.each do |word, freq|
        @document.keywords.create(name: word, frequency: freq)
      end
    end
  end
end
