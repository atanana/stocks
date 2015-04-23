class ProductPackingsController < ApplicationController
  def show
    render json: product_packing
  end

  private

  def product_packing
    ProductPacking.find params[:id]
  end
end