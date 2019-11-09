# frozen_string_literal: true

module Api::V1::Home::Serializer
  class InstitutionsSerializer < ApplicationSerializer
    set_type :institution
    attributes :institution_type, :name, :longitude, :latitude, :address
    belongs_to :account, serializer: Api::V1::Lib::Serializer::AccountSerializer
  end
end
