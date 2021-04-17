# frozen_string_literal: true

class LocationCategory < ApplicationRecord
  has_many :waste_collection_points

  validates :name, presence: true
  validates :name, uniqueness: true
end
