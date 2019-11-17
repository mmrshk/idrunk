# frozen_string_literal: true

# == Schema Information
#
# Table name: subscriptions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  trial_period :boolean          default("true"), not null
#  start_at     :datetime         not null
#  end_at       :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_subscriptions_on_user_id  (user_id)
#

class Subscription < ApplicationRecord
  belongs_to :user
end
