# frozen_string_literal: true

class WasteCategoryController < ApplicationController
  def index
    render json: serialize(WasteCategory.all, serializer: WasteCategorySerializer), status: :ok
  end

  def show
    determine_category_by_barcode(params[:code])
    render json: serialize(@waste_category), status: :ok
  end

  private

  def determine_category_by_barcode(barcode)
    details = EanCodeService.new(barcode).details
    @waste_category = WasteCategoryService.new(details).determine
  end
end
