# frozen_string_literal: true

module Api::V1::Order::Operation
  class OrderItem < ApplicationOperation
    step :set_item
    fail Macro::Semantic(failure: :not_found), fail_fast: true
    pass :set_user
    pass :set_date
    step :current_day_availiable?
    fail Macro::Semantic(failure: :bad_request)
    fail Macro::Assign(to: :errors, value: { item: [I18n.t('errors.order.current_date_not_availiable')] })
    step :set_item_date
    step Macro::Semantic(success: :created)

    def set_item(ctx, params:, **)
      ctx[:item] = Item.find_by(id: params[:item_id])
    end

    def set_user(ctx, current_account:, **)
      ctx[:user] = current_account.user
    end

    def set_date(ctx, **)
      ctx[:date_time] = DateTime.current
      ctx[:time_zone] = Time.zone
    end

    def current_day_availiable?(_ctx, user:, **)
      user.item_dates.where(start_at: Time.zone.today).empty?
    end

    def set_item_date(ctx, user:, item:, **)
      ItemDate.create(
        item_id: item.id,
        user_id: user.id,
        start_at: ctx[:date_time].beginning_of_day.in_time_zone(ctx[:time_zone]),
        end_at: ctx[:date_time].end_of_day.in_time_zone(ctx[:time_zone])
      )
    end
  end
end
