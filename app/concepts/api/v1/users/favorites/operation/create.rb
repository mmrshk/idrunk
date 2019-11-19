# frozen_string_literal: true

module Api::V1::Users::Favorites::Operation
  class Create < ApplicationOperation
    pass :get_favorite
    step :set_institution
    fail Macro::Semantic(failure: :not_found), fail_fast: true
    step :create_featured_list_item
    fail Macro::Semantic(failure: :bad_request)
    fail Macro::Assign(to: :errors, value: { favorite: [I18n.t('errors.users.favorite_is_already_in_list')] })
    step Macro::Semantic(success: :created)

    def get_favorite(ctx, current_account:, **)
      ctx[:favorite] = current_account.user.favorite
    end

    def set_institution(ctx, params:, **)
      ctx[:institution] = Institution.find_by(id: params[:institution_id])
    end

    def create_featured_list_item(_ctx, favorite:, institution:, **)
      return unless favorite.featured_list_items.joins(:institution).where(institution: institution).empty?

      FeaturedListItem.create(institution_id: institution.id, favorite_id: favorite.id)
    end
  end
end
