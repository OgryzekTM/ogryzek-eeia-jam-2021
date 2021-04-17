# frozen_string_literal: true

class WasteKeyword < ApplicationRecord
  belongs_to :waste_category

  validates :name, presence: true
  validates :name, uniqueness: true
end
