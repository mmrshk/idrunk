# frozen_string_literal: true
# == Schema Information
#
# Table name: featured_list_items
#
#  id             :integer          not null, primary key
#  institution_id :integer
#  favorite_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_featured_list_items_on_favorite_id     (favorite_id)
#  index_featured_list_items_on_institution_id  (institution_id)
#

# frozen_string_literal: true

class FeaturedListItem < ApplicationRecord
  belongs_to :favorite
  has_one :user, through: :favorite
  belongs_to :institution
end
