# frozen_string_literal: true

class WasteCollectionPointSerializer < ActiveModel::Serializer
  attributes :id, :name, :x, :y, :waste_category

  def waste_category
    {
      name: object.waste_category&.name,
      description: object.waste_category&.description
    }
  end
end
