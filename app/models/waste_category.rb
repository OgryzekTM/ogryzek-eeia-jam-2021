# frozen_string_literal: true

class WasteCategory < ApplicationRecord
  has_many :waste_products

  validates :name, presence: true
  validates :name, uniqueness: true
end
