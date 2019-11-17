# frozen_string_literal: true

# == Schema Information
#
# Table name: institutions
#
#  id               :integer          not null, primary key
#  account_id       :integer
#  institution_type :integer
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
  acts_as_mappable lat_column_name: :latitude, lng_column_name: :longitude, default_units: :kms

  belongs_to :account
  has_one :user, through: :account

  has_many :categories, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :featured_list_items, dependent: :destroy
  has_many :favorites, through: :featured_list_items, dependent: :destroy
  has_many :items, through: :categories, dependent: :destroy

  enum institution_type: { restaurant: 0, cafe: 1,  bar: 2, coffe_bar: 3 }
end
