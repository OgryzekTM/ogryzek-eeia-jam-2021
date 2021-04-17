# frozen_string_literal: true

class WasteCollectionPointController < ApplicationController
  def index
    collection = WasteCollectionPoint
                 .all
                 .with_filter(filter_params(params))
    render json: serialize(collection, serializer: WasteCollectionPointSerializer), status: :ok
  end

  private

  def filter_params(params)
    params.slice(:waste_category_id)
  end
end
