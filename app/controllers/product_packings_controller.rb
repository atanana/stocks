class ProductPackingsController < ApplicationController
  def index
    render json: ProductPacking.all
  end

  def show
    render json: product_packing
  end

  private

  def product_packing
    ProductPacking.find params[:id]
  end
end