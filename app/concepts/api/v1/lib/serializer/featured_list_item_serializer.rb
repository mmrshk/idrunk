# frozen_string_literal: true

module Api::V1::Lib::Serializer
  class FeaturedListItemSerializer < ApplicationSerializer
    set_type :featured_list_item

    belongs_to :favorite, serializer: Api::V1::Lib::Serializer::FavoriteSerializer
    belongs_to :institution, serializer: Api::V1::Home::Serializer::InstitutionSerializer
  end
end
