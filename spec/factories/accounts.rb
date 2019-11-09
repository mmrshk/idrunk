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

# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    email { FFaker::Internet.unique.email }
    password { FFaker::Internet.password }
    password_confirmation { password }
    user { nil }

    trait :with_user do
      user
    end
  end
end
