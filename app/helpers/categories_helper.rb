module CategoriesHelper
  def convert_categories(categories)
    categories.map do |category|
      {
          name: category.name,
          id: category.id
      }
    end
  end
end