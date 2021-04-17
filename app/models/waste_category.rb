# frozen_string_literal: true

class WasteCategory < ApplicationRecord
  has_many :waste_category_product_samples

  validates :name, presence: true
  validates :name, uniqueness: true
end
