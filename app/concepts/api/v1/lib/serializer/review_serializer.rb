# frozen_string_literal: true

module Api::V1::Lib::Serializer
  class ReviewSerializer < ApplicationSerializer
    set_type :review
    attribute :rating

    belongs_to :institution, serializer: Api::V1::Home::Serializer::InstitutionSerializer
    belongs_to :user, serializer: Api::V1::Lib::Serializer::UserSerializer
  end
end
