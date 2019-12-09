class Admin::CategoriesController < Admin::BaseController
  before_action :find_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)

    if @category.save
      redirect_to admin_categories_path, notice: '新增分類'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_param)
      redirect_to admin_categories_path, notice: '已更新'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: '分類已刪除'
  end

  private
  def find_category
    @category = Category.find(params[:id])
  end

  def category_param
    params.require(:category).permit(:title)
  end
end

