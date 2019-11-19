# frozen_string_literal: true

module Api::V1::Users::Account::Profiles::Serializer
  class Show < ApplicationSerializer
    set_type 'profile'
    attributes :name

    attribute :have_saved do |object, params|
      params[:current_account].items.sum(:cost)
    end

    attribute :institutions_user_where_was do |object, params|
      params[:current_account].institutions.uniq
    end

    attribute :items do |object, params|
      params[:current_account].items.uniq
    end
  end
end
