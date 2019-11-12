# frozen_string_literal: true

module Api::V1::Lib::Serializer
  class AccountSerializer < ApplicationSerializer
    set_type :account
    attributes :email, :created_at

    belongs_to :user, serializer: Api::V1::Lib::Serializer::UserSerializer

    meta do |_object, params|
      params[:options][:meta]
    end
  end
end
