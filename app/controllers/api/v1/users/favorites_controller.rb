# frozen_string_literal: true

module Api::V1::Users
  class FavoritesController < AuthorizedApiController
    def index
      endpoint Api::V1::Favorites::Operation::Index
    end
  end
end
