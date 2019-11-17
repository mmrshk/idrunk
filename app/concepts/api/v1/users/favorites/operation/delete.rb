# frozen_string_literal: true

module Api::V1::Users::Favorites::Operation
  class Delete < ApplicationOperation
    step :model
    fail Macro::Semantic(failure: :not_found), fail_fast: true
    step Policy::Guard(Api::V1::Users::Favorites::Guard::Delete.new)
    fail Macro::Semantic(failure: :unauthorized)
    step :destroy
    step Macro::Semantic(success: :destroyed)

    def model(ctx, params:, **)
      ctx[:model] = FeaturedListItem.find_by(id: params[:id])
    end

    def destroy(ctx, **)
      ctx[:model].destroy
    end
  end
end
