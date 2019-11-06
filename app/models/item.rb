# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  category_id  :integer
#  cost         :float            default("0.0"), not null
#  has_discount :boolean          default("false"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#

class Item < ApplicationRecord
  has_one :item_date, dependent: :destroy
  belongs_to :category, dependent: :destroy
  has_one :institution, through: :category, dependent: :destroy
end