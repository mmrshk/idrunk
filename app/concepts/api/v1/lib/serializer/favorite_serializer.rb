# frozen_string_literal: true

module Api::V1::Lib::Serializer
  class FavoriteSerializer < ApplicationSerializer
    set_type :favorite

    belongs_to :user, serializer: Api::V1::Lib::Serializer::UserSerializer
    has_many :institutions, serializer: Api::V1::Home::Serializer::InstitutionSerializer
    has_many :featured_list_items, serializer: Api::V1::Lib::Serializer::FeaturedListItemSerializer
  end
end
