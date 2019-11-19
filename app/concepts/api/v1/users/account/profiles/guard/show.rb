# frozen_string_literal: true

module Api::V1::Users::Account::Profiles::Guard
  class Show < ApplicationGuard
    def call(ctx, current_account:, **)
      ctx[:model] == current_account.user
    end
  end
end
