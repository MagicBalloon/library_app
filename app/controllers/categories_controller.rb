class CategoriesController < InheritedResources::Base
  before_action :set_category, only: [:show]

  def show
    @books = @category.books.where(published: true)
  end

  def show_all
    @books = Book.all.where(published: true)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
end

