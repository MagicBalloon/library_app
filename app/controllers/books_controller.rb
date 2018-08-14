class BooksController < InheritedResources::Base
  before_action :set_book, only: [:show]

  def show
    @authors = @book.authors
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end
end

