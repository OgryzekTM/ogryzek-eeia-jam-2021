# frozen_string_literal: true

class WasteCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description
end
