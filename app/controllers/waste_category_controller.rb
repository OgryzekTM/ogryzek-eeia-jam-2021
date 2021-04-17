# frozen_string_literal: true

class WasteCategoryController < ApplicationController
  def index
    barcode = params[:barcode]
    name = determine_name_by_barcode(barcode)
    set_waste_category(name)

    render json: serialize(@waste_category), status: :ok
  end

  private

  def determine_name_by_barcode(barcode)
    # todo: implement
  end

  def set_waste_category(name)
    @waste_category = WasteCategory.first
    # todo: determine category service
  end
end
