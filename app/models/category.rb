# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  title          :string           not null
#  institution_id :integer
#  parent_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_categories_on_institution_id  (institution_id)
#  index_categories_on_parent_id       (parent_id)
#

class Category < ApplicationRecord
  belongs_to :institution
  has_many :items, dependent: :destroy
end
