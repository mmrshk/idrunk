# frozen_string_literal: true

module Api::V1::Home::Operation
  class Show < ApplicationOperation
    pass :set_institution
    step Macro::Renderer(serializer: Api::V1::Home::Serializer::Institution)

    def set_institution(ctx, **)
      ctx[:model] = Institution.find_by(id: ctx[:params][:id])
    end
  end
end
