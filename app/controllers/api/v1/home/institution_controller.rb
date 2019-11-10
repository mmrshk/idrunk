# frozen_string_literal: true

module Api::V1::Home
  class InstitutionController < AuthorizedApiController
    def index
      endpoint Api::V1::Home::Operation::Index
    end

    def show
      endpoint Api::V1::Home::Operation::Show
    end
  end
end
