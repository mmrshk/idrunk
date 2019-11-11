# frozen_string_literal: true

module Api::V1::Home::Serializer
  class InstitutionsSerializer < ApplicationSerializer
    set_type :institution

    attributes :institution_type, :name, :longitude, :latitude, :address

    attribute :is_favorite do |object, params|
      return unless params[:current_account]

      params[:current_account].user.favorite.institutions.exists?(object.id)
    end
  end
end
