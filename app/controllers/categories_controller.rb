class CategoriesController < ApplicationController
  include CategoriesHelper

  def index
    render json: convert_categories(Category.all)
  end
end
