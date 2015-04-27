class ProductPackingsController < ApplicationController
  def index
    render json: ProductPacking.all
  end

  def show
    render json: product_packing
  end

  def create
    render json: ProductPacking.create(product_packing_params)
  end

  private

  def product_packing
    ProductPacking.find params[:id]
  end

  def product_packing_params
    params.require(:product_packing).permit(:name)
  end
end