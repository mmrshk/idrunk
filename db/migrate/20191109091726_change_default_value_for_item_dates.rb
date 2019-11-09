class ChangeDefaultValueForItemDates < ActiveRecord::Migration[6.0]
  change_column :item_dates, :start_at, :datetime, null: false, default: DateTime.current.beginning_of_day.in_time_zone(Time.zone)
  change_column :item_dates, :end_at, :datetime, null: false, default: DateTime.current.end_of_day.in_time_zone(Time.zone)
end
