# frozen_string_literal: true

# keyword
# t.bigint "document_id", null: false
# t.string "name", null: false
# t.integer "frequency", null: false
class Keyword < ApplicationRecord
  belongs_to :document

  validates :document_id, presence: true
  validates :name, presence: true
  validates :frequency, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
