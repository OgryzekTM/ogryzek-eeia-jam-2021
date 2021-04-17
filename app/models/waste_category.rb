# frozen_string_literal: true

class WasteCategory < ApplicationRecord
  has_many :waste_keywords
  has_many :waste_collection_points

  validates :name, presence: true
  validates :name, uniqueness: true
end
