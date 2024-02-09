# frozen_string_literal: true

module DocumentManager
  class TextSummarizer < ApplicationService
    def initialize(content)
      @content = content
    end

    def call
      sentences = @content.split(/\.|\?|!/)
      num_sentences = (sentences.size * Document::SUMMARY_RATIO).to_i
      scores = sentences.map(&:length)
      top_sentences = sentences.sort_by.with_index { |_, i| -scores[i] }.first(num_sentences)
      top_sentences.join('. ')
    end
  end
end
