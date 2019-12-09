class BooksController < ApplicationController
  before_action :find_book, only: [:show]
  layout 'book'

  def index
    @books = Book.available
                 .page(params[:page])
                 .per(10)

    @publishers = Publisher.available
  end

  def show
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end
end

