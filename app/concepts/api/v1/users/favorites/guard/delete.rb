# frozen_string_literal: true

module Api::V1::Users::Favorites::Guard
  class Delete < ApplicationGuard
    def call(ctx, current_account:, **)
      ctx[:model].user == current_account.user
    end
  end
end
