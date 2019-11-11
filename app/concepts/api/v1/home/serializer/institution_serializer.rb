# frozen_string_literal: true

module Api::V1::Home::Serializer
  class InstitutionSerializer < ApplicationSerializer
    set_type :institution
    attributes :institution_type, :name, :longitude, :latitude, :address

    has_many :categories, serializer: Api::V1::Lib::Serializer::CategorySerializer
    has_many :items, serializer: Api::V1::Lib::Serializer::ItemSerializer

    attribute :review_rating do |object|
      @reviews ||= Review.where(institution_id: object.id)
      @reviews.sum(:rating) / @reviews.count
    end

    attribute :is_favorite do |object, params|
      return unless params[:current_account]

      params[:current_account].user.favorite.institutions.exists?(object.id)
    end
  end
end
