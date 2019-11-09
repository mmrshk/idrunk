# frozen_string_literal: true

# == Schema Information
#
# Table name: featured_lists
#
#  id             :integer          not null, primary key
#  institution_id :integer
#  favorite_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_featured_lists_on_favorite_id     (favorite_id)
#  index_featured_lists_on_institution_id  (institution_id)
#

# frozen_string_literal: true

class FeaturedList < ApplicationRecord
  belongs_to :favorite, dependent: :destroy
  belongs_to :institution, dependent: :destroy
end
