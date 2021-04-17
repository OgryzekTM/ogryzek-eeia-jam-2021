# frozen_string_literal: true

class WasteCollectionPoint < ApplicationRecord
  include Filterable

  belongs_to :waste_category

  validates :name, :x, :y, presence: true
  validates :name, uniqueness: true
end
