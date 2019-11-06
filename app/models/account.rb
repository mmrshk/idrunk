# frozen_string_literal: true
# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  email           :string           default(""), not null
#  password_digest :string
#  account_type    :string
#  verified        :boolean          default("false"), not null
#  phone_number    :string           default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_accounts_on_email         (email) UNIQUE
#  index_accounts_on_phone_number  (phone_number) UNIQUE
#

# frozen_string_literal: true

class Account < ApplicationRecord
  has_secure_password
  has_one :user, dependent: :destroy
  has_many :institutions, dependent: :destroy
end
