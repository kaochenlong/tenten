class Api::BooksController < ApplicationController
  def favorite
    render json: {status: 'ok123'}
  end
end
