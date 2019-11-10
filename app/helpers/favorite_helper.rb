# frozen_string_literal: true

module FavoriteHelper
  extend ActiveSupport::Concern

  class_methods do
    def favorite?(_institution)
      true
    end
  end
end
