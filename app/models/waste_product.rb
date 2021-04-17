# frozen_string_literal: true

class WasteProduct < ApplicationRecord
  has_one :waste_category
end
