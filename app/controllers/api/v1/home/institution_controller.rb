# frozen_string_literal: true

module Api::V1::Home
  class InstitutionController < ApiController
    def index
      endpoint Api::V1::Home::Index::Operation::Index
    end

    def show; end
  end
end
