# frozen_string_literal: true

# document
# t.text "content", size: :long, null: false
# t.text "summary"
# t.integer "sentiment"
class Document < ApplicationRecord
  has_many :keywords, dependent: :delete_all

  enum sentiment: { negative: -1, neutral: 0, positive: 1 }
  attr_accessor :file

  validates :content, presence: true
  validates :content, length: { minimum: 1 }
  validates :summary, length: { maximum: 1000 }
  validates :sentiment, inclusion: { in: sentiments.keys, message: "Sentiment must be -1 (negative), 0 (neutral), or 1 (positive)" }, allow_nil: true
end
