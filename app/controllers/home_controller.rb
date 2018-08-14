class HomeController < ApplicationController
  def index
    @books = Book.where(published: true).limit(6).order(:published_at)
  end
end
