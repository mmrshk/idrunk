# frozen_string_literal: true

class FeaturedList < ApplicationRecord
  belongs_to :favorite, dependent: :destroy
  belongs_to :institution, dependent: :destroy
end
