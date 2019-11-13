# frozen_string_literal: true

module Api::V1::Users::Favorites::Operation
  class Index < ApplicationOperation
    step :get_featured_list_items
    step Macro::Assign(to: :inclusion_options, value: %i[institution])
    step Macro::Renderer(serializer: Api::V1::Lib::Serializer::FeaturedListItemSerializer, meta: :current_account)

    def get_featured_list_items(ctx, current_account:, **)
      ctx[:model] = current_account.user.favorite.featured_list_items
    end
  end
end
