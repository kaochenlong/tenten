class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.orders.build(order_params)

    current_cart.items.each do |item|
      @order.order_items.build(book: item.product, 
                               quantity: item.quantity, 
                               sell_price: item.product.sell_price)
    end

    if @order.save
      # 1. 清空購物車
      session['cart9527'] = nil
      # 2. 進入付款頁
      redirect_to root_path, notice: '訂單已成立！'
    else
      flash[:notice] = @order.errors.full_messages
      redirect_to root_path
      # render 'carts/checkout'
    end
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :tel, :address, :note)
  end
end

