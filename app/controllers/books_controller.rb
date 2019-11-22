class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
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
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to root_path, notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path, notice: '資料已刪除'
  end

  private

  # strong parameters
  def book_params
    params.require(:book).permit(:title, 
                                 :description, 
                                 :list_price,
                                 :sell_price,
                                 :page_num,
                                 :isbn,
                                 :isbn13)
  end
end
