class CartsController < ApplicationController
  def add
    current_cart.add_item(params[:id])
    session['cart9527'] = current_cart.serialize

    redirect_to root_path, notice: '成功加入購物車'
  end

  private
  def current_cart
    @cart ||= Cart.from_hash(session['cart9527'])
  end
end

