# frozen_string_literal: true

class WasteCategory < ApplicationRecord
  has_many :waste_keywords

  validates :name, presence: true
  validates :name, uniqueness: true
end
