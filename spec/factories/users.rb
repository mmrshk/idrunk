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

FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    account
  end
end
