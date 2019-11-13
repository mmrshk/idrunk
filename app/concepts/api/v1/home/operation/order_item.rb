# frozen_string_literal: true

module Api::V1::Home::Operation
  class OrderItem < ApplicationOperation
    step :create_order!
    fail Macro::Semantic(failure: :not_found)
  end
end
