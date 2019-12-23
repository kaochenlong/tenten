class CartsController < ApplicationController
  layout 'book'
  before_action :authenticate_user!, only: [:checkout]

  def add
    current_cart.add_item(params[:id])
    session['cart9527'] = current_cart.serialize

    render json: {items: current_cart.items.count}
    # redirect_to root_path, notice: '成功加入購物車'
  end

  def show
  end

  def checkout
    @order = Order.new
  end

  def destroy
    session['cart9527'] = nil
    redirect_to root_path, notice: '購物車已清空'
  end
end

