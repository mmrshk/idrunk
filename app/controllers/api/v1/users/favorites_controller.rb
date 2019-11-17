# frozen_string_literal: true

module Api::V1::Users
  class FavoritesController < AuthorizedApiController
    def index
      endpoint Api::V1::Users::Favorites::Operation::Index
    end

    def create
      endpoint Api::V1::Users::Favorites::Operation::Create
    end

    def destroy
      endpoint Api::V1::Users::Favorites::Operation::Delete
    end
  end
end
