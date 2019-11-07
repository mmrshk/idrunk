# frozen_string_literal: true

module Api::V1::Home::Index::Operation
  class Index < ApplicationOperation
    pass :set_location
    step :show_institutions
    step Macro::Renderer(serializer: Api::V1::Home::Index::Serializer::Institutions)

    def set_location(ctx, **)
      ctx[:latitude] = ctx[:params][:latitude] || Constants::Shared::DNIPRO_LATITUDE
      ctx[:longitude] = ctx[:params][:longitude] || Constants::Shared::DNIPRO_LONGITUDE
    end

    def show_institutions(ctx, latitude:, longitude:, **)
      ctx[:model] = Institution.within(Constants::Shared::DEFAULT_DISTANCE, origin: [latitude, longitude])
    end
  end
end
