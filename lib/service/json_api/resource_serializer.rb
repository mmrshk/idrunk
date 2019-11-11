# frozen_string_literal: true

module Service
  module JsonApi
    class ResourceSerializer
      private_class_method :new

      def self.call(result)
        new(result).call
      end

      def initialize(result)
        renderer = result[:renderer]
        @serializer = renderer.delete(:serializer)
        @options = renderer
        @object = result[:model]
        @current_account = result[:current_account]
      end

      def call
        serializer.new(object, params: { current_account: current_account, options: options })
      end

      private

      attr_reader :serializer, :options, :object, :current_account
    end
  end
end
