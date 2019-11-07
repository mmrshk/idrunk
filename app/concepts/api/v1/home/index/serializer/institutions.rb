# frozen_string_literal: true

module Api::V1::Home::Index::Serializer
  class Institutions < ApplicationSerializer
    set_type :institution
    attributes :institution_type, :name, :longitude, :latitude, :address
    belongs_to :account, serializer: Api::V1::Lib::Serializer::Account

    # add other relations
  end
end
