# frozen_string_literal: true

class WasteCollectionPointSerializer < ActiveModel::Serializer
  attributes :id, :name, :x, :y, :location_category

  def location_category
    {
      id: object.location_category&.id,
      name: object.location_category&.name,
      description: object.location_category&.description
    }
  end
end
