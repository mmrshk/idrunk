# frozen_string_literal: true

# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_favorites_on_user_id  (user_id)
#

class Favorite < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :featured_lists, dependent: :destroy
  has_many :institutions, through: :featured_lists, dependent: :destroy
end
