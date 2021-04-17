# frozen_string_literal: true

class WasteCategoryController < ApplicationController
  def index
    render json: serialize(WasteCategory.all, serializer: WasteCategorySerializer), status: :ok
  end

  def show
    determine_category_by_barcode(params[:code])
    determine_category_by_name(params[:name])
    if @waste_category.present?
      render json: serialize(@waste_category), status: :ok
    else
      render json: { status: 'Unprocessable entity' }, status: :unprocessable_entity
    end
  end

  private

  def determine_category_by_name(name)
    if name.present?
      details = { 'name' => name }
      @waste_category = WasteCategoryService.new(details).determine
    end
  end

  def determine_category_by_barcode(barcode)
    if barcode.present?
      details = EanCodeService.new(barcode).details
      if details['message'] == 'No such code in database'
        return nil
      end
      @waste_category = WasteCategoryService.new(details).determine
    end
  end
end
