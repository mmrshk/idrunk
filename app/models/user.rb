# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  account_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           default(""), not null
#
# Indexes
#
#  index_users_on_account_id  (account_id)
#

# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :account
  has_many :item_dates, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one :institution, dependent: :destroy
  has_one :subscription, dependent: :destroy
  has_one :favorite, dependent: :destroy
end
