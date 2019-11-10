# frozen_string_literal: true

module Api::V1::Home::Serializer
  class InstitutionsSerializer < ApplicationSerializer
    include FavoriteHelper

    set_type :institution

    attributes :institution_type, :name, :longitude, :latitude, :address

    attribute :is_favorite do |object|
      favorite?(object)
    end
  end
end
