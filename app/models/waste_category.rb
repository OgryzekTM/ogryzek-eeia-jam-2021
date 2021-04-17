# frozen_string_literal: true

class WasteCategory < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
end
