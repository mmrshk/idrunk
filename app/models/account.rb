# frozen_string_literal: true
# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  verified        :boolean          default("false")
#
# Indexes
#
#  index_accounts_on_email  (email) UNIQUE
#

# frozen_string_literal: true

class Account < ApplicationRecord
  has_secure_password
  has_one :user, dependent: :destroy
end
