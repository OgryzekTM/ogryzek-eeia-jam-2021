# frozen_string_literal: true

class WasteCollectionPoint < ApplicationRecord
  has_one :waste_category

  validates :name, :x, :y, presence: true
  validates :name, uniqueness: true
end
