# frozen_string_literal: true

module Api::V1::Lib::Serializer
  class UserSerializer < ApplicationSerializer
    set_type :user
    attribute :name

    belongs_to :account, serializer: Api::V1::Lib::Serializer::AccountSerializer
    has_many :categories, serializer: Api::V1::Lib::Serializer::CategorySerializer
    has_many :reviews, serializer: Api::V1::Lib::Serializer::ReviewSerializer
  end
end
