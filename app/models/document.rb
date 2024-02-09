# frozen_string_literal: true

# document
# t.text "content", size: :long, null: false
# t.text "summary"
# t.integer "sentiment"
class Document < ApplicationRecord
  has_many :keywords, dependent: :delete_all

  enum sentiment: { negative: -1, neutral: 0, positive: 1 }
  attr_accessor :file

  TOP_KEYWORDS = 5
  SUMMARY_RATIO = 0.1

  validates :content, presence: true
  validates :content, length: { minimum: 1 }
  validates :sentiment, inclusion: { in: sentiments.keys, message: 'Sentiment must be -1 (negative), 0 (neutral), or 1 (positive)' }, allow_nil: true

  after_create_commit :process_document


  private

  def process_document
    summary = DocumentManager::TextSummarizer.call(content)
    keywords = DocumentManager::KeywordAnalyzer.call(content)
    sentiment = DocumentManager::SentimentAnalyzer.call(content)

    transaction do
      update(summary:, sentiment:)
      KeywordManager::KeywordCreator.call(self, keywords)
    end
  end
end
