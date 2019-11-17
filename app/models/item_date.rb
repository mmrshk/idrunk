# frozen_string_literal: true

# == Schema Information
#
# Table name: item_dates
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_id    :integer
#  available  :boolean          default("true")
#  start_at   :datetime         default("2019-11-10 00:00:00"), not null
#  end_at     :datetime         default("2019-11-10 23:59:59.999999"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_item_dates_on_item_id  (item_id)
#  index_item_dates_on_user_id  (user_id)
#

class ItemDate < ApplicationRecord
  belongs_to :user
  belongs_to :item
end
