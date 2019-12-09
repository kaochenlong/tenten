class CategoriesController < ApplicationController
  layout 'book'

  def show
    @category = Category.find(params[:id])
    @books = @category.books.page(params[:page])
  end
end

