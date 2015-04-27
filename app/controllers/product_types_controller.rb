class ProductTypesController < ApplicationController
  def index
    render json: ProductType.all
  end

  def show
    render json: product_type
  end

  def create
    render json: ProductType.create(product_type_params)
  end

  private

  def product_type
    ProductType.find params[:id]
  end

  def product_type_params
    params.require(:product_type).permit(:name)
  end
end