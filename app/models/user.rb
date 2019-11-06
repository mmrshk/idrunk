# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  account_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_account_id  (account_id)
#

# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :account
end
