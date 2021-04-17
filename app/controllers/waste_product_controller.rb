# frozen_string_literal: true

class WasteProductController < ApplicationController
  def index
    barcode = params[:barcode]
    name = params[:name] || determine_name_by_barcode(barcode)
    set_waste_product(name)

    render json: serialize(@waste_product), status: :ok
  end

  private

  def determine_name_by_barcode(barcode)
    #todo: implement
  end

  def set_waste_product(name)
    @waste_product = WasteProduct.find_by(name: name)
  end
end
