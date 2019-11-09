# frozen_string_literal: true

module Api::V1::Lib::Serializer
  class Account < ApplicationSerializer
    set_type :review
    attributes :rating
  end
end
