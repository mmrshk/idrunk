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
