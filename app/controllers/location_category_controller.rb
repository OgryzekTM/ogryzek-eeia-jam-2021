# frozen_string_literal: true

class LocationCategoryController < ApplicationController
  def index
    render json: serialize(LocationCategory.all, serializer: LocationCategorySerializer), status: :ok
  end
end
