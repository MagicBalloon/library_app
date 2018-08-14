class CategoriesController < InheritedResources::Base
  before_action :set_category, only: [:show]

  def show
    @books = @category.books
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
end

