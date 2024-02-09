# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :set_document, only: [:show]

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(
      content: DocumentManager::DocumentReader.call(document_params[:file])
    )

    if @document.save
      render turbo_stream: [
        turbo_stream.update('document-data', "<h3>Document##{@document.id} <a href='#{document_path(@document)}'>View Details</a></h3><div>#{@document.content}</div>")
      ]
    else
      render turbo_stream: [
        turbo_stream.update('failure-reasons', @document.errors.full_messages.join(';'))
      ]
    end
  end

  # GET /documents/:id
  def show; end

  private

  # Set document
  def set_document
    @document = Document.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through
  def document_params
    params.require(:document).permit(:file)
  end
end
