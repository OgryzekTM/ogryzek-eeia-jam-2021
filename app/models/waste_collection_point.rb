# frozen_string_literal: true

class WasteCollectionPoint < ApplicationRecord
  include Filterable

  belongs_to :location_category

  validates :name, :x, :y, :location_category_id, presence: true
  validates :name, uniqueness: true
end
