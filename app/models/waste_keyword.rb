# frozen_string_literal: true

class WasteKeyword < ApplicationRecord
  has_one :waste_category

  validates :name, presence: true
  validates :name, uniqueness: true
end
