# frozen_string_literal: true

class WasteProductSerializer < ActiveModel::Serializer
  attributes :name, :category

  def category
    {
      name: object.waste_category&.name,
      description: object.waste_category&.description
    }
  end
end
