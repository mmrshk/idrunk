# frozen_string_literal: true

module Api::V1::Order
  class OrderController < AuthorizedApiController
    def create
      endpoint Api::V1::Order::Operation::OrderItem
    end
  end
end
