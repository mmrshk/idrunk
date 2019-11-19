# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  email           :string           default(""), not null
#  password_digest :string
#  account_type    :integer
#  verified        :boolean          default("false"), not null
#  phone_number    :string           default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  owner_mode      :boolean          default("false")
#
# Indexes
#
#  index_accounts_on_email         (email) UNIQUE
#  index_accounts_on_phone_number  (phone_number) UNIQUE
#

class Account < ApplicationRecord
  has_secure_password

  has_one :user, dependent: :destroy
  has_many :item_dates, through: :user, dependent: :destroy
  has_many :items, through: :item_dates, dependent: :destroy
  has_many :institutions, through: :items, dependent: :destroy

  enum account_type: { customer: 0, owner: 1 }
end
