# frozen_string_literal: true

# == Schema Information
#
# Table name: institutions
#
#  id               :integer          not null, primary key
#  account_id       :integer
#  institution_type :string
#  name             :string           not null
#  latitude         :float
#  longitude        :float
#  address          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_institutions_on_account_id  (account_id)
#  index_institutions_on_latitude    (latitude)
#  index_institutions_on_longitude   (longitude)
#

class Institution < ApplicationRecord
  belongs_to :account, dependent: :destroy
  has_one :user, through: :account, dependent: :destroy

  has_many :categories, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :featured_lists, dependent: :destroy
  has_many :favorites, through: :featured_lists, dependent: :destroy
  has_many :items, through: :categories, dependent: :destroy
end
