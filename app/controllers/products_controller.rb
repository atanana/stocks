class ProductsController < ApplicationController
  def show
    render json: product
  end

  def update
    render json: product.update(product_params)
  end

  def create
    render json: Product.create(product_params)
  end

  def destroy
    render json: product.destroy
  end

  private

    def product
      Product.find params[:id]
    end

    def product_params
      params.require(:product).permit(:open, :category_id, :product_type_id, :product_packing_id)
    end
end