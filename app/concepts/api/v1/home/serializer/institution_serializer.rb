# frozen_string_literal: true

module Api::V1::Home::Serializer
  class InstitutionSerializer < ApplicationSerializer
    set_type :institution
    attributes :institution_type, :name, :longitude, :latitude, :address

    has_many :categories, serializer: Api::V1::Lib::Serializer::CategorySerializer

    attribute :review_rating do |object|
      @reviews ||= Review.where(institution_id: object.id)
      @reviews.sum(:rating) / @reviews.count
    end
  end
end
