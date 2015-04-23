class ProductTypesController < ApplicationController
  def show
    render json: product_type
  end

  private

  def product_type
    ProductType.find params[:id]
  end
end