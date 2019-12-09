class BooksController < ApplicationController
  before_action :find_book, only: [:show, :comment]
  layout 'book'

  def index
    @books = Book.available
                 .page(params[:page])
                 .per(10)

    @publishers = Publisher.available
  end

  def show
    @comment = Comment.new
    @comments = @book.comments.order(id: :desc)
  end

  def comment
    # comment 角度
    # @comment = Comment.new(comment_params, user: current_user, book: @book)

    # book 角度
    @comment = @book.comments.build(comment_params)

    # user 角度
    # @comment = current_user.comments.build(comment_params, book: @book)

    if @comment.save
      redirect_to @book, notice: '留言成功'
    else
      # 失敗
    end
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end

  def comment_params
    params.require(:comment)
          .permit(:title, :content)
          .merge(user: current_user)
  end
end

