# frozen_string_literal: true

module Api::V1::Lib::Serializer
  class ItemSerializer < ApplicationSerializer
    set_type :item
    attributes :cost, :has_discount

    has_one :category, serializer: Api::V1::Lib::Serializer::CategorySerializer
    has_one :institution, serializer: Api::V1::Home::Serializer::InstitutionSerializer
  end
end
