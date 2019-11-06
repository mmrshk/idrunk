# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id             :integer          not null, primary key
#  institution_id :integer
#  user_id        :integer
#  rating         :float            default("0.0"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_reviews_on_institution_id  (institution_id)
#  index_reviews_on_user_id         (user_id)
#

class Review < ApplicationRecord
  belongs_to :institution, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
