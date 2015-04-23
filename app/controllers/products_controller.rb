class ProductsController < ApplicationController
  def show
    render json: product
  end

  private

    def product
      Product.find params[:id]
    end
end