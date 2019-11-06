# frozen_string_literal: true

# == Schema Information
#
# Table name: item_dates
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_id    :integer
#  available  :boolean          default("true")
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_item_dates_on_item_id  (item_id)
#  index_item_dates_on_user_id  (user_id)
#

class ItemDate < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :item, dependent: :destroy
end
