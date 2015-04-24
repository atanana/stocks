class CategoriesController < ApplicationController
  def index
    render json: Category.all
  end

  def show
    render json: category
  end

  def create
    render json: Category.create(category_params)
  end

  def update
    render json: category.update(category_params)
  end

  def destroy
    render json: category.destroy
  end

  private

    def category
      Category.find params[:id]
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
