# frozen_string_literal: true

module DocumentManager
  class DocumentReader < ApplicationService
    def initialize(file)
      @file = file
    end

    def call
      return @file.read if @file.respond_to?(:read)

      nil
    end
  end
end
