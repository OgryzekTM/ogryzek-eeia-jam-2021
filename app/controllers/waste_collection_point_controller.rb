# frozen_string_literal: true

class WasteCollectionPointController < ApplicationController
  def index
    collection = WasteCollectionPoint
                 .all
                 .with_filter(filter_params(params))
    render json: serialize(collection, serializer: WasteCollectionPointSerializer), status: :ok
  end

  def create
    collection_point = WasteCollectionPoint.create(product_params)
    if collection_point.valid?
      render json: collection_point.to_json, status: :ok
    else
      render json: { status: 'Unprocessable entity' }, status: :unprocessable_entity
    end
  end

  private

  def filter_params(params)
    params.slice(:location_category_id)
  end

  def product_params
    params.permit(:name, :x, :y, :location_category_id)
  end
end
