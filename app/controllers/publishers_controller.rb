class PublishersController < ApplicationController
  layout 'book'

  def show
    @publisher = Publisher.find(params[:id])
    @books = @publisher.books.page(params[:page])
  end
end

