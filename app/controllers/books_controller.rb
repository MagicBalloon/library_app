class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:title, :description, :published_at, :author_id)
    end
end

