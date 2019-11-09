# frozen_string_literal: true

module Api::V1::Lib::Serializer
  class CategorySerializer < ApplicationSerializer
    set_type :category
    attribute :title

    belongs_to :institution, serializer: Api::V1::Home::Serializer::InstitutionSerializer
    has_many :items, serializer: Api::V1::Lib::Serializer::ItemSerializer
  end
end
