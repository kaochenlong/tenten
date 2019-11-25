class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.where(on_sell: true).with_attached_cover_image
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params) 

    if @book.save
      redirect_to root_path, notice: '新增成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to root_path, notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path, notice: '資料已刪除'
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, 
                                 :description, 
                                 :list_price,
                                 :sell_price,
                                 :page_num,
                                 :isbn,
                                 :isbn13, 
                                 :cover_image, 
                                 :on_sell)
  end
end
